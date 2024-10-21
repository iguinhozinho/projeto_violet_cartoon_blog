
# Blog Violet Cartoon

![Screenshot](https://github.com/user-attachments/assets/5aa577ed-d5ef-4d5f-a576-102ecb6a3842)

## Sobre o Projeto
O **Violet Cartoon** é um blog pessoal desenvolvido como parte de um trabalho acadêmico, focado em críticas e informações sobre filmes e séries de animação. O projeto utiliza uma stack moderna e combina diversas tecnologias para criar uma aplicação dinâmica e responsiva.

### Tecnologias Utilizadas
- **Python**: Linguagem de programação usada no backend.
- **Flask**: Framework web para criação e gerenciamento da aplicação.
- **HTML**: Utilizado para estruturar o conteúdo das páginas web.
- **CSS**: Para estilizar e dar formato às páginas.
- **Bootstrap**: Framework CSS para responsividade e design moderno.
- **SQLAlchemy**: ORM utilizado para interagir com o banco de dados.
- **PhpMyAdmin**: Sistema de gerenciamento de banco de dados para armazenar postagens e usuários.

## Estrutura do Projeto

A estrutura de diretórios do projeto segue o padrão recomendado, com uma separação clara entre os arquivos de configuração, templates e estáticos:

```
Violet-Cartoon-Blog/
│
├── __pycache__/
├── app.py
├── blog_db.sql
├── extensions.py
├── models.py
├── static/
│   ├── css/
│   │   └── styles.css
│   └── uploads/
├── templates/
│   ├── base.html
│   ├── editar_postagem.html
│   ├── gerenciar_postagens.html
│   ├── home.html
│   ├── login.html
│   ├── post_detail.html
│   ├── post.html
│   └── register.html
```

### Arquivos e Diretórios
- **app.py**: Arquivo principal da aplicação Flask, responsável por iniciar o servidor e configurar rotas.
- **blog_db.sql**: Script SQL utilizado para criar e popular o banco de dados.
- **extensions.py**: Configuração de extensões da aplicação, como o SQLAlchemy.
- **models.py**: Definição dos modelos de dados, como `Users` e `Posts`.
- **static/**: Contém os arquivos estáticos, incluindo o CSS e uploads de imagens.
- **templates/**: Diretório com os templates HTML utilizados para renderizar as páginas da aplicação.

## Funcionalidades
- **Cadastro e Login de Usuários**: Usuários podem se registrar e fazer login para acessar funcionalidades exclusivas.
- **Criação de Postagens**: Usuários autenticados podem criar novas postagens de blog.
- **Edição e Exclusão de Postagens**: Usuários podem editar ou excluir suas postagens.
- **Visualização de Postagens**: Todas as postagens estão disponíveis na página inicial e podem ser visualizadas em detalhe.
- **Postagens Recomendadas**: Sugestões de postagens relacionadas são exibidas na página de detalhes de cada postagem.

## Instruções para Executar o Projeto

### 1. Clone o Repositório
```bash
git clone https://github.com/iguinhozinho/projeto_violet_cartoon_blog.git
cd violet-cartoon-blog
```

### 2. Crie um Ambiente Virtual
Crie e ative um ambiente virtual para isolar as dependências do projeto:

```bash
python -m venv venv
source venv/bin/activate  # No Windows use `venv\Scripts\activate`
```

### 3. Instale as Dependências
Instale todas as bibliotecas necessárias especificadas no arquivo `requirements.txt`:

```bash
pip install -r requirements.txt
```

### 4. Configure o Banco de Dados
Utilize o arquivo `blog_db.sql` para importar o banco de dados:

```bash
# No MariaDB ou MySQL, execute o script SQL
mysql -u usuario -p database_name < blog_db.sql
```

### 5. Execute a Aplicação
Com tudo configurado, execute a aplicação Flask:

```bash
python app.py
```

### 6. Acesse a Aplicação
Abra o navegador e acesse:

```
http://127.0.0.1:5000/
```

## Backup e Importação do Banco de Dados
O backup do banco de dados está disponível no arquivo `blog_db.sql`. Ele pode ser usado para restaurar ou migrar os dados em outro ambiente.

---
