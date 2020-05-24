# importing required stuff
import os
import json
import requests
from flask import Flask, session, render_template
from flask_session import Session
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

# Init Flask app
app = Flask(__name__)

# Check for environment variable
if not os.getenv("DATABASE_URL"):
    raise RuntimeError("DATABASE_URL is not set")

# Configure session to use filesystem
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

with open("../../goodreads_key.json.txt") as json_file:
    goodreads_json = json.load(json_file)

# print(goodreads_json['key'])


# Set up database
engine = create_engine(os.getenv("DATABASE_URL"))
db = scoped_session(sessionmaker(bind=engine))


@app.route("/")
def index():

    res = requests.get("https://www.goodreads.com/book/review_counts.json",
                       params={"key": goodreads_json['key'], "isbns": "9781632168146"})
    print(res.json())
    return "Project 1: TODO"


@app.errorhandler(404)
def page_not_found():
    render_template("page_not_found.html"), 404
