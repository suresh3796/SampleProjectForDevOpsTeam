# Use a base image with Java and Maven installed
FROM maven:3.6.3-openjdk-8-slim AS build

# Set the working directory in the container
WORKDIR .

# Copy the project's pom.xml to the container
COPY pom.xml .

# Download the project dependencies
RUN mvn dependency:go-offline -B

# Copy the project source code to the container
COPY src ./src

# Build the project
RUN mvn package

# Use a separate image for the runtime environment
FROM openjdk:8-jre-slim

# Set the working directory in the container
WORKDIR .

# Copy the built artifact from the previous stage
COPY --from=build /target/mavenAvantageSerenityIntellij-1.0-SNAPSHOT.jar .

# Expose any necessary ports
EXPOSE 8080

# Set the command to run the application
CMD ["java", "-jar", "mavenAvantageSerenityIntellij-1.0-SNAPSHOT.jar", "mvn", "clean", "verify"]
