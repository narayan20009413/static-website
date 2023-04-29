# Base image
FROM ubuntu

# Update package manager
RUN apt-get update

# Install nginx
RUN apt-get install nginx -y

# Copy your static website files to the container
COPY . /var/www/html

# Expose the default HTTP port
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx","-g","daemon off;"]