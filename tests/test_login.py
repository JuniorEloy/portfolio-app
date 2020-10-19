from app import create_app as application
from app.routes import init_routes

import unittest

class login_status_code200(unittest.TestCase):
    def setUp(self) -> None:
        #instancia app
        self.app = application()
        #desabilita o login required, pode retornar 302
        self.app.config['LOGIN_DISABLED'] = True
        #adiciona o contexto do app
        self.context = self.app.app_context()
        #envia o contexto para o app
        self.context.push()
        #cria o client para teste dentro do app com contexto
        self.client = self.app.test_client()

    def test_login_page(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)

    def tearDown(self) -> None:
        self.context.pop()
