FROM python:3.9
WORKDIR /test
RUN apt-get update
RUN pip install --upgrade pip

COPY requirements.txt ./ 
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

CMD ["python", "./sample.py"]
