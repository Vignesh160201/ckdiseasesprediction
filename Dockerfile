FROM python:3.11-slim

WORKDIR /app

COPY . .

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["streamlit", "run", "streamlit_app.py", "--server.port=8000", "--server.address=0.0.0.0"]