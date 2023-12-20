# https://gallery.ecr.aws/ubuntu/redis
FROM public.ecr.aws/ubuntu/redis:6.0-22.04_edge
RUN <<EOF
apt-get update
apt-get -y install --no-install-recommends wget gnupg ca-certificates
wget -O - https://openresty.org/package/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/openresty.gpg
apt-get -y install lsb-release
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/openresty.gpg] http://openresty.org/package/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/openresty.list > /dev/null
apt-get update
apt-get -y install openresty
apt-get -y install nginx
apt-get -y install lua5.4
EOF


# Use 8080 instead of 80 to avoid the `nginx: [emerg] bind() to 0.0.0.0:80 failed (13: Permission denied)` when using ECS.
# EXPOSE 8080
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
