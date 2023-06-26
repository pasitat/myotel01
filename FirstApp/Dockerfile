# Install Tomcat & openjdk 8 (openjdk has java and javac)
FROM tomcat:jdk8-openjdk
# Copy source files to tomcat folder structure
RUN ["mkdir","/usr/local/tomcat/webapps/FirstApp"]
COPY . /usr/local/tomcat/webapps/FirstApp
COPY ./setenv.sh /usr/local/tomcat/bin/
# -cp, Adding compile time classpath as Tomcat's /lib/servlet-api.jar file.
# - d, destination output location.
ENV OTEL_TRACES_EXPORTER=otlp
ENV OTEL_METRICS_EXPORTER=otlp
ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://172.26.48.58:5555
ENV OTEL_TRACES_SAMPLER=always_on
ENV OTEL_IMR_EXPORT_INTERVAL=5000
ENV OTEL_METRIC_EXPORT_INTERVAL=5000
ENV OTEL_RESOURCE_ATTRIBUTES=service.name=second-app,service.version=1.0,deployment.environment=development


RUN ["javac", "-cp", ".:/usr/local/tomcat/lib/servlet-api.jar", "-d", "/usr/local/tomcat/webapps/FirstApp/WEB-INF/classes/", "/usr/local/tomcat/webapps/FirstApp/src/TestingServlet.java"]

RUN ["javac", "-cp", ".:/usr/local/tomcat/lib/servlet-api.jar", "-d", "/usr/local/tomcat/webapps/FirstApp/WEB-INF/classes/", "/usr/local/tomcat/webapps/FirstApp/src/FirstApplicationServlet.java"]

# Serve Tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]
