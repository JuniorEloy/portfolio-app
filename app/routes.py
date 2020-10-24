from flask import render_template

def init_routes(app):
    
    @app.route('/')
    def hello_world():
        return render_template('teste.html')
