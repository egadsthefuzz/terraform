#!/bin/bash -xe
exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1
sudo -u splunk echo -e "[general]\nserverName = "$(curl http://169.254.169.254/latest/meta-data/local-hostname)"-ixr" > /data/splunk/splunk/etc/system/local/server.conf
sudo -u splunk echo -e "[default]\nhost = "$(curl http://169.254.169.254/latest/meta-data/local-hostname)"-ixr" > /data/splunk/splunk/etc/system/local/inputs.conf
sudo -u splunk echo -e "[replication_port://${splunkindexer_clusterrepport}]\n[clustering]\nmaster_uri = https://${indexer_clustermaster}:${splunkmgmt}\nmode = slave\npass4SymmKey = ${indexer_clusterkey}" >> /data/splunk/splunk/etc/system/local/server.conf
sudo -u splunk echo -e "[splunktcp:${splunkingest}]" >> /data/splunk/splunk/etc/system/default/inputs.conf
sudo -u splunk /data/splunk/splunk/bin/splunk edit licenser-localslave -master_uri 'https://${license_master_hostname}:${splunkmgmt}' -auth admin:${splunkadminpass}
service splunk restart
service splunk stop
sudo -u splunk /data/splunk/splunk/bin/splunk clone-prep-clear-config -auth admin:${splunkadminpass}
service splunk start
sudo -u splunk /data/splunk/splunk/bin/splunk edit cluster-config -mode slave -master_uri 'https://${indexer_clustermaster}:${splunkmgmt}' -replication_port ${splunkindexer_clusterrepport} -auth admin:${splunkadminpass}
service splunk restart