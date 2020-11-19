sudo docker volume create grafana_data

sudo docker run -d \
  p 3000:3000 \
  --name=grafana \
  --restart=always \
  -v grafana_data:/var/lib/grafana \
  -e "GF_INSTALL_PLUGINS=natel-discrete-panel,blackmirror1-singlestat-math-panel" \
  grafana/grafana 
