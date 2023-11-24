FROM openjdk
COPY . /app
WORKDIR /app
RUN javac Atharv.java
CMD ["java", "Atharv"]