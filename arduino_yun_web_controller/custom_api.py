from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello rvill!"

@app.route("/getID")
def getID():
    return "123456"

if __name__ == "__main__":
     app.run(host='rvill.scripts.mit.edu')
