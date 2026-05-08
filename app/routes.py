from flask import jsonify
from services.greeting_service import get_greeting

def register_routes(app):

    @app.route("/")
    def home():
        return jsonify({
            "message": "Welcome to Flask Python App"
        })

    @app.route("/greet/<name>")
    def greet(name):
        return jsonify({
            "message": get_greeting(name)
        })

    # Intentional error endpoint for Jenkins AI demo
    @app.route("/error")
    def error():
        number = 10 / 0
        return str(number)