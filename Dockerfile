# Build maven image using docker 
FROM maven:3-adoptopenjdk-8 as mvn_build
WORKDIR /app
copy . .
RUN mvn clean package

# Deploy war file in to tomcat from mvn_build
FROM tomcat:8.0
COPY --from=mvn_build /app/target/*.war /usr/local/tomcat/webapps

