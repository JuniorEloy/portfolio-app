FROM python:3.8.6-alpine

RUN apk add python3-dev \
            build-base \
            linux-headers 

WORKDIR /
COPY /app /app
COPY /static /static
COPY /templates /templates
COPY ./requirements.txt /
COPY ./wsgi.ini /
COPY ./wsgi.py /
COPY ./server.py /

RUN pip install -r /requirements.txt

EXPOSE 5003

CMD ["uwsgi", "--ini", "/wsgi.ini"]