# Use an official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your FastAPI app code
COPY . .

# Expose port
EXPOSE 8000

# Command to run the app
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
CMD uvicorn app.main:app --host 0.0.0.0 --port 8000
FROM python 
WORKDIR /app
COPY  . .
EXPOSE 8000
CMD [ "uvicorn","app.main:app", "--host","0.0.0.0","--port","8000" ]

