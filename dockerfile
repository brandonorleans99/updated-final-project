# Nginx as base image
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Copy HTML files to the default path
COPY index.html /usr/share/nginx/html

# Define the command to start Nginx
CMD ["nginx", "-g", "daemon off;"]

# Define a health check
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/ || exit 1