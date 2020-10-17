## get docker node id of master
NODE_ID=$(docker node ls | grep $(hostname) | awk '{print $1}')
## set label name=datacenter
docker node update --label-add name=datacenter $NODE_ID