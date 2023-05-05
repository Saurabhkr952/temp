FROM nginx

# Copy custom configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx in foreground mode
CMD ["nginx", "-g", "daemon off;"]
