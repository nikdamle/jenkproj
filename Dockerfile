FROM gradle:8.13.0-jdk17-corretto AS BUILD
WORKDIR /app
COPY . .
RUN gradle clean -x test war

FROM tomcat:9.0.104-jdk17-corretto
COPY --from=BUILD /app/build/libs/jenkproj.war /usr/local/tomcat/webapps/
EXPOSE 8080