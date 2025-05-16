# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# copy html file into the container
COPY index.html /usr/share/nginx/html

# custom : config file
# COPY default.conf /etc/nginx/conf.d/default.conf

# expose port 80
EXPOSE 80

#start nginx
CMD ["nginx", "-g", "daemon off;"]

