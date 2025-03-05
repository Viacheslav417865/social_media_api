FROM python:alpine3.19

LABEL maintainer="sfinks417865@gmail.com"

ENV PYTHONUNBUFFERED=1

WORKDIR /app/

COPY requirements.txt requirements.txt

RUN apk add --no-cache gcc musl-dev postgresql-dev
RUN pip install -r requirements.txt

COPY . .

RUN mkdir -p /files/media

RUN adduser --disabled-password --no-create-home user

RUN chown -R user /files/media
RUN chmod -R 755 /files/media

USER user
