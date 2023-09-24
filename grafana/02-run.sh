docker run -it --rm --name grafana --network ecosystem -p 3000:3000 \
   -v /Users/jayvanzyl/Documents/Projects/ecosystem-oss-builds/grafana/grafana/grafana:/var/lib/grafana \
   -e "GF_INSTALL_PLUGINS=marcusolsson-json-datasource,volkovlabs-echarts-panel" \
   ecosystemai/ecosystem-grafana

   # -e "GF_SECURITY_ALLOW_EMBEDDING=true" \
   # -e "GF_AUTH_DISABLE_LOGIN_FORM=true" \
   # -e "GF_AUTH_ANONYMOUS_ENABLED=true" \

