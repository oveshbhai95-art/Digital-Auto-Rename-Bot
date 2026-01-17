# Use a more recent and stable base image
FROM python:3.9-slim-bullseye

# Update and install ffmpeg in a single step to keep image small
RUN apt-get update -qq && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy and install requirements first (better for caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Command to run the bot
CMD ["python", "bot.py"]
