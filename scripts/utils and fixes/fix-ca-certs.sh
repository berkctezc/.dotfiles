#!/bin/bash

sudo touch /etc/ssl/certs/ca-certificates.crt;

sudo wget -O /etc/ssl/certs/ca-certificates.crt https://curl.se/ca/cacert.pem;

sudo ln -sf /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-bundle.crt;

cat /etc/ssl/certs/ca-certificates.crt;

sudo chmod 644 /etc/ssl/certs/ca-certificates.crt;