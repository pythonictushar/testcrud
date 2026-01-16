FROM python:3.11

# Set working directory in container
WORKDIR /crud

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install python-jose[cryptography] passlib[bcrypt]

# Copy all project files
COPY . .

# Run app with auto-reload (dev mode)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]