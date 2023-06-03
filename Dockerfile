# Use an official Python runtime as the base image
FROM python:latest

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY requirements.txt /app
COPY userapi.py /app

# Install the required packages via pip
RUN pip install --no-cache-dir \
    Flask==1.0.3 \
    Flask-MySQL==1.4.0 \
    PyMySQL==0.9.3 \
    uWSGI==2.0.17.1 \
    mysql-connector-python \
    cryptography

ENV MYSQL_DATABASE_USER="admin"
ENV MYSQL_DATABASE_PASSWORD="admin123"
ENV MYSQL_DATABASE_DB="database-1"
ENV MYSQL_DATABASE_PORT="3306"

# Expose port 5000 for the Flask application
EXPOSE 5000

# Set the entry point to the Flask application
ENTRYPOINT ["python"]

# Set the default command to run the Flask application
CMD ["userapi.py"]

