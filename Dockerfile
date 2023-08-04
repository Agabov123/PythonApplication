# Use the official Python base image
FROM python:3.9-slim

# Install system dependencies required for building Python packages (if needed)
RUN apt-get update && apt-get install -y build-essential libffi-dev

# Set the working directory in the container
WORKDIR /app

# Copy the Python app files into the container
COPY app.py .
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the Flask app will run on
EXPOSE 5000

# Set the command to run the Flask app
CMD ["python", "app.py"]
