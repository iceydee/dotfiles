export KOPS_STATE_STORE=s3://clusters.plingot.com
KUBECONFIGS=$(find ~/.kube/configs -type f | tr '\n' ':')
KUBECONFIGS=${KUBECONFIGS: : -1}
export KUBECONFIG=${KUBECONFIGS}
