# Use the official Python image as the base image
FROM python:3.8



ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y libpq-dev gcc

WORKDIR /miniproject

COPY . .

COPY migrate.sh /miniproject/migrate.sh
COPY entrypoint.sh /miniproject/entrypoint.sh

RUN chmod +x /miniproject/migrate.sh
RUN chmod +x /miniproject/entrypoint.sh

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

ENV DJANGO_SETTINGS_MODULE=miniproject.settings

# Run app.py when the container launches
CMD ["sh", "./entrypoint.sh"]


# # Use an official Python runtime as a parent image
# FROM python:3.8

# # Set the working directory in the container
# WORKDIR /app

# # Copy the current directory contents into the container
# COPY . /app

# # Install any needed packages specified in requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# # Make port 8000 available to the world outside this container
# EXPOSE 8000

# # Define environment variable
# ENV DJANGO_SETTINGS_MODULE=miniproject.settings

# # Run app.py when the container launches
# CMD ["gunicorn", "miniproject.wsgi:application", "--bind", "0.0.0.0:8000"]
