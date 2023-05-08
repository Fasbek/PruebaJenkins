#ARG MSVC_NAME=productos

FROM openjdk:11 as builder
#ARG MSVC_NAME

#WORKDIR /app/productos
WORKDIR /app/

#COPY ./pom.xml /app
#COPY ./$MSVC_NAME/.mvn ./.mvn
#COPY ./$MSVC_NAME/mvnw .
#COPY ./$MSVC_NAME/pom.xml .

#RUN ./mvnw clean package -Dmaven.test.skip -Dmaven.main.skip -Dspring-boot.repackage.skip && rm -r ./target/
#RUN ./mvnw dependency:go-offline

#COPY ./$MSVC_NAME/src ./src

#RUN ./mvnw clean package -DskipTests

#FROM openjdk:11

#WORKDIR /app
RUN mkdir ./logs
#ARG MSVC_NAME

#ARG TARGET_FOLDER=/app/$MSVC_NAME/target
#COPY --from=builder $TARGET_FOLDER/productos-0.0.1-SNAPSHOT.jar .
COPY productos-0.0.1-SNAPSHOT.jar .

#ARG PORT_APP=8009
#ENV PORT $PORT_APP
#EXPOSE $PORT

ENTRYPOINT ["java", "-jar", "productos-0.0.1-SNAPSHOT.jar"] 