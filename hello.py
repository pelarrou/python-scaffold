from flask import Flask
from flask import jsonify
from flask import Response

app = Flask(__name__)


@app.route("/")
def hello() -> str:
    """Return a friendly HTTP greeting."""
    print("I am inside hello world")
    return "Hello World! CD"


@app.route("/echo/<name>")
def echo(name: str) -> Response:
    print(f"This was placed in the url: new-{name}")
    val = {"new-name": name}
    return jsonify(val)


def add(x: int, y: int) -> int:
    return x + y


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
