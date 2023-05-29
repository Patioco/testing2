# Use an official Python runtime as the base image
FROM python:3.8

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the required packages via pip
RUN pip install --no-cache-dir \
    Flask==1.0.3 \
    Flask-MySQL==1.4.0 \
    PyMySQL==0.9.3 \
    uWSGI==2.0.17.1 \
    mysql-connector-python \
    cryptography

# Expose port 80 for the Flask application
EXPOSE 80

# Set the entry point to the Flask application
ENTRYPOINT ["uwsgi"]

# Set the default command to run the Flask application
CMD ["--http", "0.0.0.0:80", "--wsgi-file", "app.py", "--callable", "app", "--master", "--processes", "4", "--threads", "2"]

