terraform-k8s-spinnaker
=======================

Requires a service account and a JSON creds key.
Create one in your project [here](https://console.cloud.google.com/apis/credentials/serviceaccountkey) with a suitable role.

[Configure](https://cloud.google.com/sdk/docs/initializing) your gcloud auth, then...
```
export GCP_PROJECT_ID=[YOUR_PROJECT_ID]
# TF looks for the env var GOOGLE_CLOUD_KEYFILE_JSON by default
export GOOGLE_CLOUD_KEYFILE_JSON=~/.gcp/terraform/terraform-${GCP_PROJECT_ID}.json
gcloud iam service-accounts create terraform --display-name "Terraform admin account"
gcloud projects add-iam-policy-binding ${GCP_PROJECT_ID} --member "serviceAccount:terraform@${GCP_PROJECT_ID}.iam.gserviceaccount.com" --role "roles/editor"
gcloud iam service-accounts keys create $GCP_KEYFILE --iam-account terraform@${GCP_PROJECT_ID}.iam.gserviceaccount.com
```
UPDATE:
There is currently an issue where a new service account does not have the relevant permissions.
The workaround was to create a key for the 'default service account' and use that.

Manual Helm deploy
==================
```
gcloud container clusters get-credentials spinnaker1 --zone europe-west2-a --project ${GCP_PROJECT_ID}
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm install -n spin1 stable/spinnaker -f values.yaml --timeout 300 --namespace spinnaker
```
