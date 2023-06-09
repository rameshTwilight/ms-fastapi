FROM python:3.11-slim

COPY ./app /app

COPY ./entrypoint.sh /entrypoint.sh

COPY ./requirements.txt /requirements.txt

RUN apt-get update
RUN apt-get install -y build-essential python3-dev python3-setuptools make gcc tesseract-ocr

RUN python3 -m pip install -r requirements.txt
RUN apt-get remove -y --purge make gcc build-essential
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

RUN chmod +x entrypoint.sh

EXPOSE 8000
