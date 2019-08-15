FROM gradle:4.10-jdk8 as builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle clean build
RUN cd build/libs
RUN ls -l -a

FROM openjdk:10-jre-slim
COPY --from=builder /home/gradle/src/build/libs/app-0.0.1.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]