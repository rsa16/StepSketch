import os
from google import genai
from .gui import main as run_gui_app

API_KEY = os.getenv("GEMINI_API_KEY", None)

if not API_KEY:
    print("ERROR: please provide api key in environment variable GEMINI_API_KEY")

client = genai.Client(api_key=API_KEY)

def main():
    run_gui_app(client)

if __name__ == "__main__":
    main()
