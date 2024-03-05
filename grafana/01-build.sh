echo "=============================================================="
echo "Important steps to update plugins:"
echo "1. build container"
echo "2. run container, 3. stop container, 4. rerun container "
echo "5. new rebuild that components are installed"
echo "6. push once plugin updates were tested in second run"
echo "=============================================================="

docker build --platform linux/amd64 -f Dockerfile -t ecosystemai/ecosystem-grafana .

# install plugins
# default
docker stop grafana
docker rm grafana
echo ""
echo "ctlC to kill run and build final."
echo ""
docker run -it --rm --name grafana --network ecosystem -p 3000:3000 \
   -v /Users/jayvanzyl/Documents/Projects/ecosystem-oss-builds/grafana/grafana/grafana:/var/lib/grafana \
   -e "GF_INSTALL_PLUGINS=marcusolsson-json-datasource,volkovlabs-echarts-panel" \
   ecosystemai/ecosystem-grafana

sleep 5
docker build --platform linux/amd64 -f Dockerfile -t ecosystemai/ecosystem-grafana .
docker build --platform linux/arm64/v8 -f Dockerfile -t ecosystemai/ecosystem-grafana:arm64 .
