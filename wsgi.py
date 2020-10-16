from app import create_app as application

if __name__ == '__main__':
    app = application()

    app.run(port=5003, host='0.0.0.0', debug=True)