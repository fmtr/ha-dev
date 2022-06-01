#!/usr/bin/with-contenv bashio

export PASSWORD="$(bashio::config 'password')"
export PORT="$(bashio::config 'port')"
export COMMAND="$(bashio::config 'command')"

echo "root:${PASSWORD}" | chpasswd

echo ${COMMAND} >> command.sh
echo >> command.sh
echo /usr/sbin/sshd -D -o Port=${PORT} -o PermitRootLogin=yes -o PasswordAuthentication=yes -o AllowTcpForwarding=yes >> command.sh

chmod +x command.sh
bash -x command.sh

