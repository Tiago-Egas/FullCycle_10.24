# Set the base image
FROM python:3.12.6-slim

# Set the environment variable
ENV PIPENV_VENV_IN_PROJECT=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONFAULTHANDLER=1
ENV PYTHONUNBUFFERED=1

# Install pipenv
RUN pip install pipenv
RUN apt-get update && apt-get install -y --no-install-recommends gcc

# Set the working directory
WORKDIR /django

# Copy the current directory to the working directory
COPY . .

# Install the dependencies
RUN pip install --upgrade pipenv

# Deploy the dependencies
RUN pipenv install --dev --deploy

# Command to run at the start
CMD ["tail", "-f", "/dev/null"]