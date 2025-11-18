FROM python:3.11

ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y python3-pip

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY mysite .

CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]