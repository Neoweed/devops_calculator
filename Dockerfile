FROM openjdk:8-alpine
COPY /target/devops_calculator-1.0-SNAPSHOT.jar /home/devops_calculator-1.0-SNAPSHOT.jar
CMD ["java","-cp","/home/devops_calculator-1.0-SNAPSHOT.jar", "Calculator"]