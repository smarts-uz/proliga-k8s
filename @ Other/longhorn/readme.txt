sudo apt update
sudo apt install -y nfs-common
sudo modprobe nfs
sudo modprobe dm_crypt
kubectl -n kube-system scale deployment coredns --replicas=3
