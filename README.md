# kube-ipfs
Kubernetes configurations for IPFS on GCE. Note that this requires `cert-manager` if you use the ingress features.

## Deployment
1. Add a new blank disk on GCE called `ipfs-data` that is 20GB. You can always expand it later.
2. Edit `kube/ipfs-ingress.yml` with your preferred domain name.
3. Run `kubectl apply -f kube`.
4. Get your ingress IP, and setup DNS to match the changes in step 2.
5. Profit!
