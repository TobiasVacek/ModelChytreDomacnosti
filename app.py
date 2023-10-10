from flask import Flask, request, jsonify
import random


class App:
    def __init__(self) -> None:
        self.app = Flask(__name__)
        self.app.route("/getData", methods=["GET"])(self.getData)

    def getData(self):
        return (
            jsonify(
                {
                    "temperature": random.randint(100, 200)/10,
                    "curtains": random.randint(0, 100),
                    "light": [random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)]
                }

            ), 200
        )


if __name__ == "__main__":
    app = App()

    app.app.run(debug=True, host="localhost", port=80)
