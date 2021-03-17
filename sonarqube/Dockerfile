FROM sonarqube:8.7-community
USER root
RUN apk add --no-cache wget curl java-cacerts jq postgresql-client
RUN ln -sf /etc/ssl/certs/java/cacerts /opt/java/openjdk/lib/security/cacerts
WORKDIR /opt/sonarqube
COPY ./start-with-profile.sh .
ADD ./rules /tmp/rules
ADD sonar.properties /opt/sonarqube/conf/sonar.properties
RUN chown -R sonarqube:sonarqube . && chmod +x start-with-profile.sh
USER sonarqube
CMD ["./start-with-profile.sh"]
