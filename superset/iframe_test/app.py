from flask import Flask, render_template
import random
app = Flask(__name__)

@app.route("/")
def index():
    urls = [
        "http://127.0.0.1:8080/login?token=admin"
#       "http://127.0.0.1:8080/login?token=d"
#	"http://127.0.0.1:8080"
    ]
    iframe = random.choice(urls)
    return render_template('index.html', iframe=iframe)

if __name__ == "__main__":
    app.run(debug=True, port=5001)
