# Use a Maven and Java base image
FROM maven:3.8.4-openjdk-11



# Set up the working directory
WORKDIR /app


# Copy the project files
COPY src /app/src

# Download dependencies
RUN mvn dependency:resolve

# Build and run tests
CMD ["mvn", "clean", "verify"]
