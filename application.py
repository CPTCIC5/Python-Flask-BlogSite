from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import json

with open('config.json','r')as c:
    params=json.load(c)["params"]

app = Flask(__name__)
app.config['SECRET_KEY'] = "secret_string"
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-pass']
)
mail = Mail(app)

app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False

db=SQLAlchemy(app)
app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost/blogger'

class contacts(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(80), nullable=False)
    phone=db.Column(db.Integer,nullable=True)
    email=db.Column(db.String(100),nullable=False)
    message=db.Column(db.String(1000),nullable=False)

class Posts(db.Model):
    sno=db.Column(db.Integer,primary_key=True)
    title=db.Column(db.String(50),nullable=False)
    subtitle=db.Column(db.String(100),nullable=True)
    content=db.Column(db.String(250),nullable=False)
    slug=db.Column(db.String(25),nullable=False)
    img_file=db.Column(db.String(35),nullable=True)

@app.route('/')
def home():
    users=Posts.query.all()
    return render_template('index.html',params=params,users=users)

@app.route('/about')
def about():
    return render_template('about.html',params=params)


@app.route('/login',methods=["GET","POST"])
def login():
    if 'uname'in session and session['uname']==params['admin-user']:
        n1=Posts.query.all()
        return render_template('dashboard.html',params=params,n1=n1)

    if (request.method=='POST'):
        user=request.form.get('user')
        password=request.form.get('password')
        if user==params['admin-user'] and password==params['admin-pass']:
            session['uname'] =user
            n1=Posts.query.all()
            return render_template('dashboard.html',params=params,n1=n1)

        else:
            return render_template('login.html',params=params)
    else:
        return render_template('login.html',params=params)


@app.route("/edit/<string:sno>",methods=["GET","POST"])
def editing(sno):
    if 'uname' in session and session['uname'] == params['admin-user']:
        if (request.method=="POST"):
            __title__=request.form.get('title')
            __subtitle__ = request.form.get('subtitle')
            __content__ = request.form.get('content')
            __slug__ = request.form.get('slug')
            if sno == 0:
                posts = Posts(title=__title__,subtitle=__subtitle__,content=__content__, slug=__slug__)
                db.session.add(posts)
                db.session.commit()
                return render_template('edit.html',sno=sno,params=params,posts=posts)
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=__title__
                post.subtitle=__subtitle__
                post.content=__content__
                post.slug=__slug__
                db.session.add(post)
                db.session.commit()
                redirect('/edit/0'+sno)
                post=Posts.query.filter_by(sno=sno).first()
            return render_template('edit.html',sno=sno,params=params,post=post)
        post=Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',sno=sno,params=params,post=post)

@app.route('/logout',methods=["GET","POST"])
def logout():
    if 'uname'in session and session['uname']==params['admin-user']:
        session.pop('uname')
        return redirect('/login')

@app.route("/post/<string:slug>",methods=["GET"])
def samplepost(slug):
    post=Posts.query.filter_by(slug=slug).first_or_404()
    return render_template('post.html',post=post,params=params)

@app.route('/contact',methods=["GET","POST"])
def Contact():
    if (request.method == 'POST'):
        name=request.form.get('name')
        phone=request.form.get('phone')
        email=request.form.get('email')
        message=request.form.get('message')
        entry=contacts(name=name,phone=phone,email=email,message=message)
        db.session.add(entry)
        db.session.commit()

        mail.send_message('NEW MSG FROM '+name,
                          sender=email,
                          recipients=[params['gmail-user']],
                          body=message +"\n" + phone
                          )
    return render_template('contact.html',params=params)

if __name__=="__main__":
    app.run(debug=True)
