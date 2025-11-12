FROM amazoncorretto:8
EXPOSE 8080
WORKDIR /usr/src/myapp

COPY pom.xml mvnw ./
COPY .mvn .mvn

RUN ./mvnw dependency:go-offline -B

COPY src ./src

RUN ./mvnw package -B

CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
