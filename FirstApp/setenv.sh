export CATALINA_OPTS="$CATALINA_OPTS -javaagent:/usr/local/tomcat/webapps/FirstApp/opentelemetry-javaagent.jar"
export OTEL_EXPORTER_OTLP_ENDPOINT=http://172.26.48.58:5555
export OTEL_RESOURCE_ATTRIBUTES=service.name=FirstApp
