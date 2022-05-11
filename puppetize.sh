# Changes default directory used by yum for caching
sed -i 's|var/cache|cached/.vcache|g' /etc/yum.conf

# Configure yum for caching any downloaded package
sed -i 's|keepcache=0|keepcache=1|g' /etc/yum.conf

# Configure hosts file
cat > /etc/hosts <<EOF
127.0.0.1       localhost
192.168.33.10   puppet.example.com puppet
192.168.33.20   node01.example.com node01
EOF

# Installing the puppet-agent package directly from the puppet server using a script
curl --insecure https://puppet.example.com:8140/packages/current/install.bash | bash
