FROM python:3-alpine

WORKDIR /
COPY /app /app
COPY ./requirements.txt /
COPY ./wsgi.ini /
COPY ./wsgi.py /

RUN pip install -r /requirements.txt

RUN apk del .build-dependencies && rm -rf /var/cache/apk/*

EXPOSE 80

CMD ["uwsgi", "--ini", "/wsgi.ini"]