#!/bin/bash

# Start the Django application
gunicorn -c miniproject/gunicorn_config.py miniproject.wsgi:application
