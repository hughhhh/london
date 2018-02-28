from flask import Flask
from flask import request
from flask import jsonify
import sys
import optparse
import time
import os
import requests

app = Flask(__name__)

@app.route('/ciao', methods=['GET'])
def hello_world():
    return jsonify({'msg': 'ciao'})

if __name__ == '__main__':
    parser = optparse.OptionParser(usage="python app.py -p 8080")
    parser.add_option('-p', '--port', action='store', dest='port', help='The port to listen on.')
    (args, _) = parser.parse_args()
    if args.port == None:
        print "Missing required argument: -p/--port"
        sys.exit(1)
    app.run(host='0.0.0.0', port=int(args.port), debug=False)
