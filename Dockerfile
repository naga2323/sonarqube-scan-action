FROM sonarsource/sonar-scanner-cli:4.8

LABEL version="1.2.0" \
      repository="https://github.com/sonarsource/sonarqube-scan-action" \
      homepage="https://github.com/sonarsource/sonarqube-scan-action" \
      maintainer="SonarSource" \
      com.github.actions.name="SonarQube Scan" \
      com.github.actions.description="Scan your code with SonarQube to detect Bugs, Vulnerabilities and Code Smells in up to 27 programming languages!" \
      com.github.actions.icon="check" \
      com.github.actions.color="green"

RUN curl -s -u "mani.n.2@pg.com:Singam#1982" -X POST https://sonarqubeenterprise.pgcloud.com/sonarqube/web_api/api/qualitygates/select?projectKey=ims-unified-ui&gateName=ims_base_quality_gate
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod +x /cleanup.sh
ENTRYPOINT ["/entrypoint.sh"]
