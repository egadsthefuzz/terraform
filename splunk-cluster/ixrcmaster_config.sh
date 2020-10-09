#!/bin/bash -xe
exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1
sudo -u splunk echo -e "[general]\nserverName = "$(curl http://169.254.169.254/latest/meta-data/local-hostname)"-ixrmaster" > /data/splunk/splunk/etc/system/local/server.conf
sudo -u splunk echo -e "[default]\nhost = "$(curl http://169.254.169.254/latest/meta-data/local-hostname)"-ixrmaster" > /data/splunk/splunk/etc/system/local/inputs.conf
sudo -u splunk echo -e "[clustering]\nmode=master\nreplication_factor = ${indexer_clusterrepf}\nsearch_factor = ${indexer_clustersf}\npass4SymmKey = ${indexer_clusterkey}\ncluster_label = ${indexer_clusterlabel}" >> /data/splunk/splunk/etc/system/local/server.conf
sudo -u splunk /data/splunk/splunk/bin/splunk edit licenser-localslave -master_uri 'https://${license_master_hostname}:${splunk_mgmt_port}' -auth admin:${splunkadminpass}
service splunk restart
service splunk stop
sudo -u splunk /data/splunk/splunk/bin/splunk clone-prep-clear-config -auth admin:${splunkadminpass}
service splunk start
sudo -u splunk /data/splunk/splunk/bin/splunk edit cluster-config -mode master -replication_factor ${indexer_clusterrepf} -search_factor ${indexer_clustersf} -auth admin:${splunkadminpass}
service splunk restart
