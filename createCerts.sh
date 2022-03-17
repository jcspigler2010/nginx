#!/bin/bash

### create local registry which is externally accessible
# if [ "$#" -ne 1 ]
# then
#   echo "Usage: Must supply a CA"
#   exit 1
# fi
sudo mkdir /certs
sudo chmod 755 -R /certs
cd /certs

# createCA(){
#   sudo openssl genrsa -des3 -out $DOMAIN.key 2048
#
#   sudo openssl req -x509 -new -nodes -key $DOMAIN.key -sha256 -days 1825 -out $DOMAIN.pem
# }
#
#
# DOMAIN=$1
$CERT_NAME
### Begin script

sudo mkdir /certs
sudo chmod 755 -R /certs
cd /certs

sudo openssl genrsa -des3 -out myCA.key 2048

sudo openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem

sudo openssl genrsa -out ${CERT_NAME}.key 2048

sudo openssl req -new -key ${CERT_NAME}.key -out ${CERT_NAME}.csr

sudo tee -a ./${CERT_NAME}.ext >/dev/null <<'EOF'
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = api.example.com
DNS.2 = api
DNS.3 = localhost
EOF


sudo openssl x509 -req -in ${CERT_NAME}.csr -CA myCA.pem -CAkey myCA.key -CAcreateserial \
-out api.example.com.crt -days 825 -sha256 -extfile ${CERT_NAME}.ext
