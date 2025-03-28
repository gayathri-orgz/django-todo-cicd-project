FROM python:3.10 

# Install required packages
RUN apt-get update && apt-get install -y python3-distutils

# Set the working directory
WORKDIR /app

# Copy all files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run migrations
RUN python manage.py migrate  

# Expose the application port
EXPOSE 8000

# Start the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
