#!/bin/sh

UUID=""
WS_PATH="/"
encode() {
  arg1=$1
  base64 $arg1 
}

cat > config.json << EOF
{
  "log": {
    "loglevel": "none"
    },
    "inbounds": [
        {
            "port": 3000,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "${UUID}",
                        "alterId": 4
                    }
                ]
            },
            "streamSettings": {
                "network":"ws",
                "wsSettings": {
                    "path": "${WS_PATH}"
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom",
            "settings": {}
        }
    ]
}
EOF

pencil_config_pb=./pen config config.json | encode
rm config.json
# Creat start.sh and then encrypt it with shc
cat > start.sh << EOF
#!/bin/sh
p_config_pb="${pencil_config_pb}"
echo \$p_config_pb | base64 -di > config.pb
chmod 0755 ./pencil
./pencil -config=./config.pb  >/dev/null 2>/dev/null&
sleep 5 ; rm   ./config.pb 
sleep 999d
EOF

export CFLAGS=-static 
shc -r -f  start.sh 
rm start.sh.x.c start.sh 
mv start.sh.x hello_world
