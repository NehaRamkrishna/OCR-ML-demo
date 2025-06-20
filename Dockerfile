FROM python:3.10-slim

RUN apt-get update && apt-get install -y git
export GIT_PYTHON_REFRESH=quiet
# Install OCR & PDF utilities
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all source code
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the OCR pipeline
CMD ["python", "ocr/main.py"]
