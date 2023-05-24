# Use a Maven and Java base image
FROM maven:3.8.4-openjdk-11

EXPOSE 4444

# Set up the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget unzip chromium

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget -q https://chromedriver.storage.googleapis.com/LATEST_RELEASE -O chromedriver_version && \
    wget -q https://chromedriver.storage.googleapis.com/$(cat chromedriver_version)/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    rm chromedriver_linux64.zip && \
    mv chromedriver /usr/local/bin/chromedriver && \
    chmod +x /usr/local/bin/chromedriver

# Copy the project files
COPY pom.xml /app
COPY src /app/src

# Copy the serenity.conf file
COPY /src/test/resources/serenity.conf /app/serenity.conf

# Download dependencies
RUN mvn dependency:resolve

# Build and run tests
CMD ["mvn", "clean", "verify"]