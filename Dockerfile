# Set the base image
FROM python:3.12.6-slim

# Create a new user
RUN useradd -ms /bin/bash django

# Create the working directory
RUN mkdir /home/django/app

# Update the package list
RUN pip install --upgrade pip

# Copy the current directory to the working directory
COPY . .

# Change ownership of the working directory to the new user
RUN chown -R django:django /home/django/app

# Set the user to the new user
USER django

# Set the working directory
WORKDIR /home/django/app

# Install pipenv
RUN pip install pipenv

# Set the environment variable
ENV PIPENV_VENV_IN_PROJECT=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONFAULTHANDLER=1

# Set this folder as venv folder
RUN python -m venv .venv

# # Install the dependencies
# RUN pipenv install -r requirements.txt

# # Command to run at the start
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Command to run at the start
CMD [ "tail", "-f", "/dev/null" ]