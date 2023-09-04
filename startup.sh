#!/bin/bash

# Read the secret into a variable
SECRET_USERNAME=$(grep -oP '"username":"\K[^"]+' /mnt/secrets-store/my-nginx-app_secrets | awk -F'"' '{print $1}')

# Create or modify an HTML file to contain the secret value
echo "Hello from Generative AI UC#11, secret variable text username: $SECRET_USERNAME" > /usr/share/nginx/html/index.html

# Start Nginx in the foreground
exec nginx -g "daemon off;"
