from flask import Flask, jsonify, request
import os

# Importez votre fonction get_weather() depuis votre fichier main
from main import get_weather

app = Flask(__name__)

@app.route('/weather', methods=['GET'])
def weather():
    latitude = request.args.get('LATTITUDE')
    longitude = request.args.get('LONGITUDE')

    print(latitude, longitude)
    
    if not latitude or not longitude:
        return jsonify({'error': 'Latitude or longitude missing'}), 400
    
    try:
        latitude = float(latitude)
        longitude = float(longitude)
    except ValueError:
        return jsonify({'error': 'Latitude or longitude is not a valid number'}), 400
    
    try:
        weather_description, temperature = get_weather(latitude, longitude)
        return jsonify({'weather_description': weather_description, 'temperature': temperature}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True , host='0.0.0.0',port=80)
