#/bin/sh

sudo yum -y install epel-release

echo "init ansible install"
sudo yum -y install ansible

echo "config host names"

cat <<EOT >>/etc/hosts
192.168.56.2 control-node
192.168.56.3 aplication
192.168.56.4 database
EOT