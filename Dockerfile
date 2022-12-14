
FROM python:3.8-alpine
RUN pip install flask
# Make dir app
RUN mkdir /app
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Expose port 8080 to the outside world
EXPOSE 8080

# Run the executable

CMD ["python", "app.py"]
