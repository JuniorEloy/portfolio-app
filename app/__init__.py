from flask import Flask
from app.routes import init_routes
from flask_wtf.csrf import CSRFProtect

def create_app():

    app = Flask(__name__)
    init_routes(app)

    csrf = CSRFProtect()
    csrf.init_app(app)

    return app

