# Python 3.10 use karein kyunki pyrofork 2.3.69 isi par chalta hai
FROM python:3.10-slim-bullseye

# Install ffmpeg
RUN apt-get update -qq && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Requirements install karein
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "bot.py"]

