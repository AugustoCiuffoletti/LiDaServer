#! /bin/bash

cd
source lidaEnv/bin/activate
cd mlida/server
# python app.py # development server
gunicorn --bind 0.0.0.0:5000 app:LidaApp # production server
