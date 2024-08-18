# Use a slim Python image as the base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the JWT generation script into the container
COPY webapp.py /app/

# Default command to run the script (overridden in docker-compose)
CMD ["python", "webapp.py"]
