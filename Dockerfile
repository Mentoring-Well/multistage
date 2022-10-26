FROM maven:3.8.6 as build
COPY . .
RUN mvn clean package

FROM openjdk:17
COPY --from=build /target/mentoria-0.0.1-SNAPSHOT.jar mentoria.jar
CMD ["java", "-jar", "mentoria.jar"]