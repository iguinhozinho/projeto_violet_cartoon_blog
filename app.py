from flask import Flask, render_template, redirect, url_for, request, flash, session
from werkzeug.security import generate_password_hash, check_password_hash
from werkzeug.utils import secure_filename
import os
from extensions import db
from sqlalchemy.sql.expression import func

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/blog_db'
app.config['UPLOAD_FOLDER'] = 'static/uploads/'

db.init_app(app)

from models import Users, Posts

with app.app_context():
    db.create_all()

@app.route('/')
def index():
    posts = Posts.query.order_by(Posts.created_at.desc()).all()
    return render_template('home.html', posts=posts)

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
        new_user = Users(username=username, password=hashed_password)
        db.session.add(new_user)
        db.session.commit()
        flash('Conta criada com sucesso!')
        return redirect(url_for('login'))
    return render_template('register.html')
    
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = Users.query.filter_by(username=username).first()
        
        if user and check_password_hash(user.password, password):
            session['user_id'] = user.id
            flash('Login realizado com sucesso!')
            return redirect(url_for('index'))
        else:
            flash('Nome de usuário ou senha incorretos.')
    
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('user_id', None)
    flash('Desconectado com sucesso!')
    return redirect(url_for('login'))

@app.route('/post', methods=['GET', 'POST'])
def post():
    if 'user_id' not in session:
        flash('Você precisa estar logado para criar uma postagem.')
        return redirect(url_for('login'))
    
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']
        image = request.files['image']
        filename = secure_filename(image.filename)
        image.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        
        new_post = Posts(title=title, content=content, image=filename, user_id=session['user_id'])
        db.session.add(new_post)
        db.session.commit()
        flash('Postagem criada com sucesso!')
        return redirect(url_for('index'))
    
    return render_template('post.html')

@app.route('/post/<int:post_id>')
def post_detail(post_id):
    post = Posts.query.get_or_404(post_id)
    recommended_posts = Posts.query.filter(Posts.id != post_id).order_by(func.random()).limit(2).all()
    return render_template('post_detail.html', post=post, recommended_posts=recommended_posts)

@app.route('/gerenciar_postagens')
def gerenciar_postagens():
    if 'user_id' not in session:
        flash('Você precisa estar logado para acessar esta página.')
        return redirect(url_for('login'))
    
    postagens = Posts.query.order_by(Posts.created_at.desc()).all()
    return render_template('gerenciar_postagens.html', postagens=postagens)

@app.route('/editar_postagem/<int:post_id>', methods=['GET', 'POST'])
def editar_postagem(post_id):
    if 'user_id' not in session:
        flash('Você precisa estar logado para acessar esta página.')
        return redirect(url_for('login'))
    
    postagem = Posts.query.get_or_404(post_id)
    if postagem.user_id != session['user_id']:
        flash('Você não tem permissão para editar esta postagem.')
        return redirect(url_for('gerenciar_postagens'))
    
    if request.method == 'POST':
        postagem.title = request.form['title']
        postagem.content = request.form['content']
        if 'image' in request.files:
            image = request.files['image']
            if image.filename != '':
                filename = secure_filename(image.filename)
                image.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                postagem.image = filename
        db.session.commit()
        flash('Postagem atualizada com sucesso!')
        return redirect(url_for('gerenciar_postagens'))
    
    return render_template('editar_postagem.html', postagem=postagem)

@app.route('/excluir_postagem/<int:post_id>', methods=['POST'])
def excluir_postagem(post_id):
    if 'user_id' not in session:
        flash('Você precisa estar logado para acessar esta página.')
        return redirect(url_for('login'))
    
    postagem = Posts.query.get_or_404(post_id)
    if postagem.user_id != session['user_id']:
        flash('Você não tem permissão para excluir esta postagem.')
        return redirect(url_for('gerenciar_postagens'))
    
    db.session.delete(postagem)
    db.session.commit()
    flash('Postagem excluída com sucesso!')
    return redirect(url_for('gerenciar_postagens'))

if __name__ == '__main__':
    app.run(debug=True)