from app import create_app as application

app = application()

if __name__ == '__main__':
    
    app.run(port=5003, host='0.0.0.0', debug=True)