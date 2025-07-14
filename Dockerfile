FROM python:3.8-buster

COPY . /app
WORKDIR /app

RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list
RUN sed -i 's/security.debian.org/archive.debian.org/g' /etc/apt/sources.list
RUN sed -i '/stretch-updates/d' /etc/apt/sources.list

RUN apt update
RUN apt install -y default-libmysqlclient-dev gcc
RUN pip install -r blog/requirements.txt

EXPOSE 8000
CMD ["/bin/bash", "-c", "python blog/manage.py runserver"]
