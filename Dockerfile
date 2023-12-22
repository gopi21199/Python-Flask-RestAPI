FROM python:3.7

WORKDIR /opt/app

COPY . .
RUN apt update -y
RUN groupadd -r user && useradd -r -g user useradd
USER user
RUN pip install --no-cache-dir -r requirements-prod.txt

EXPOSE 5000

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]