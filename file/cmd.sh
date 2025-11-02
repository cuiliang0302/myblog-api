acme.sh --install-cert -d *.cuiliangblog.cn -d cuiliangblog.cn \
--key-file       /opt/acme/cuiliangblog/key.pem  \
--fullchain-file /opt/acme/cuiliangblog/cert.pem \
--reloadcmd     "nginx -s reload"
