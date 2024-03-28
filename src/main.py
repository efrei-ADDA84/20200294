import os
import requests

def get_weather(latitude, longitude):
    api_key = "23cf78df12255dcdc7868bf9c415df3e"
    if not api_key:
        raise ValueError("OpenWeather API key is not set")
    
    url = f"http://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={api_key}&units=metric"
    response = requests.get(url)
    response.raise_for_status()  # Lève une exception en cas d'erreur HTTP
    
    data = response.json()
    weather_description = data['weather'][0]['description']
    temperature = data['main']['temp']
    
    return weather_description, temperature

def main():
    latitude = os.getenv("LATITUDE")
    longitude = os.getenv("LONGITUDE")
    
    if latitude is None or longitude is None:
        print("Latitude or longitude not provided in environment variables")
        return
    
    try:
        latitude = float(latitude)
        longitude = float(longitude)
    except ValueError:
        print("Latitude or longitude is not a valid number")
        return
    
    try:
        weather_description, temperature = get_weather(latitude, longitude)
        print(f"La météo actuelle est : {weather_description} avec une température de {temperature}°C.")
    except requests.exceptions.HTTPError as err:
        print(f"Erreur lors de la récupération des données météo : {err}")
    except Exception as e:
        print(f"Une erreur est survenue : {e}")

if __name__ == "__main__":
    main()
