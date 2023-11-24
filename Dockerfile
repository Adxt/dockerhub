# Use the official OpenJDK base image
FROM openjdk

# Set the working directory
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/Atharv.jar /app/Atharv.jar

# Specify the command to run on container startup
CMD ["java", "-jar", "Atharv.jar"]
