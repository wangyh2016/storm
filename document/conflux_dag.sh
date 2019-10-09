#!/bin/bash

rm -rf iri-1.5.5.jar
cd ../../..
#mvn clean ; mvn package
cp target/iri-1.5.5.jar scripts/examples/one_node
cd scripts/examples/one_node
rm -rf testnetdb*
rm -rf ixi
rm -rf streamnet*

java  -jar iri-1.5.5.jar  --testnet \
                        --mwm 1 \
                        --walk-validator "NULL" \
                        --ledger-validator "NULL" \
                        -p 14700 \
			--udp-receiver-port 14600 \
			--tcp-receiver-port 14600 \
			--neighbors "tcp://172.31.18.177:14600" \
			--neighbors "tcp://172.31.22.86:14600" \
                        --max-peers 40 \
                        --remote \
                        --enable-streaming-graph \
                        --entrypoint-selector-algorithm "KATZ" \
                        --tip-sel-algo "CONFLUX" \
                        --ipfs-txns false \
                        --batch-txns false \
                        --weight-calculation-algorithm "IN_MEM" \
			--ancestor-forward-enable true \
                        --ancestor-create-frequency 1000 \
                        &>  streamnet.log &
			#--neighbors "tcp://172.31.29.65:14600" \
			#--neighbors "tcp://172.31.31.32:14600" \
			#--ancestor-forward-enable true \
			# --ancestor-create-frequency 1000 
