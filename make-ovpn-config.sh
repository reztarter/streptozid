#!/bin/bash 
# Скрипт генерирует клиентский конфиг .ovpn
# Первый аргумент: Идентификатор клиента

KEY_DIR=~/openvpn-ca/keys 
OUTPUT_DIR=~/openvpn-ca/client-configs/files 
BASE_CONFIG= ~/openvpn-ca/client-configs/client.conf 

cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ${KEY_DIR}/ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ${KEY_DIR}/${1}.crt \
    <(echo -e '</cert>\n<key>') \
    ${KEY_DIR}/${1}.key \
    <(echo -e '</key>\n<tls-auth>') \
    ${KEY_DIR}/ta.key \
    <(echo -e '</tls-auth>') \
    > ${OUTPUT_DIR}/${1}.ovpn
