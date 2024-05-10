from flask import Flask, jsonify, request

app = Flask(__name__)

testing_types = [
  { 'name': 'Hello Test, I want to see you', 'description': 'testing individual units of source code' }
]

@app.route('/tests')
def get_tests():
  return jsonify(testing_types)


@app.route('/tests', methods=['POST'])
def add_test():
  testing_types.append(request.get_json())
  return '', 204
  
  
  
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug=True)  
