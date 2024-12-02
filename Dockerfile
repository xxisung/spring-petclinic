FROM openjdk:17-oracle
ARG JAP_FILE_PATH=./target/*.jar
COPY ${JAT_FILE_PATH} spring-petclinic.jar
EXPOSE 8080
ENTRYPOINT ["java?", "-jar", "spring-petclinic.jar"]
