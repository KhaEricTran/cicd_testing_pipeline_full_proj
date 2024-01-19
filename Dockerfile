FROM mariadb:latest

# Copy the initialization script to the docker entrypoint directory
COPY db-init.sql /docker-entrypoint-initdb.d/

# Set environment variables
# ENV MYSQL_ROOT_PASSWORD=rmit_password
# ENV MYSQL_DATABASE=rmit_store_db
# ENV MYSQL_USER=db_admin
# ENV MYSQL_PASSWORD=rmit_password

# Expose port 3306
EXPOSE 3306
