sudo k3s kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.9.1/deploy/longhorn.yaml
sudo k3s kubectl -n longhorn-system get pods
sudo k3s kubectl -n longhorn-system get svc
sudo k3s kubectl -n longhorn-system port-forward svc/longhorn-frontend 8080:80 --address 0.0.0.0


# Download the release binary.
curl -LO "https://github.com/longhorn/cli/releases/download/v1.9.2/longhornctl-linux-amd64"
Validate the binary:

# Download the checksum for your architecture.
curl -LO "https://github.com/longhorn/cli/releases/download/v1.9.2/longhornctl-linux-amd64.sha256"

# Verify the downloaded binary matches the checksum.
echo "$(cat longhornctl-linux-amd64.sha256 | awk '{print $1}') longhornctl-linux-amd64" | sha256sum --check

Install the binary:
sudo install longhornctl-linux-amd64 /usr/local/bin/longhornctl

Verify installation:
longhornctl version

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
sudo chmod +r /etc/rancher/k3s/k3s.yaml
longhornctl check preflight