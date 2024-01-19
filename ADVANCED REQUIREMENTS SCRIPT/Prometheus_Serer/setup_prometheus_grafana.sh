#!/bin/bash

# Install Prometheus
sudo yum install prometheus

# Start Prometheus
sudo systemctl start prometheus
sudo systemctl enable prometheus

# Verify Prometheus status
sudo systemctl status prometheus

# Install Grafana
sudo yum install grafana

# Start Grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Verify Grafana status
sudo systemctl status grafana-server

# Note: Access Grafana UI at http://<EC2-Instance-IP>:3000
