FROM tomcat:9.0.1-jre8-alpine

# Remove o app padrão
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copia o ROOT.war pro local correto
COPY target/ROOT.war /usr/local/tomcat/webapps/ROOT.war
