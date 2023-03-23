from flask import Flask, jsonify
import pandas as pd

app = Flask(__name__)

data = pd.read_csv('flutter.csv').to_dict(orient='records')

@app.route('/api/data')
def get_data():
    return jsonify(data)

@app.route('/api/data/<column>/<value>')
def get_filtered_data(column, value):
    filtered_data = [row for row in data if row[column] == value]
    return jsonify(filtered_data)

if __name__ == '__main__':
    app.run(debug=True)


