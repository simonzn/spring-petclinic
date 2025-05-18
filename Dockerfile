FROM eclipse-temurin:17.0.15_6-jdk-alpine AS build
WORKDIR /app
COPY . .
RUN ./mvnw package

FROM eclipse-temurin:17.0.15_6-jre-alpine AS run
WORKDIR /app
COPY --from=build /app/target/*.jar petclinic.jar
EXPOSE 8080
CMD ["java", "-jar", "petclinic.jar"]
