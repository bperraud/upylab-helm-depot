# Deploying UpyLab with Helm

To install a Kubernetes cluster on Google Cloud Platform (GCP) and deploy applications using Helm releases, you can follow these general steps:

1. **Create a Google Cloud Account**: If you haven't already, sign up for a Google Cloud Platform account at [Google Cloud](https://cloud.google.com/).

2. **Install and Set Up Google Cloud SDK**: Install the Google Cloud SDK, which provides the command-line interface for interacting with GCP services. Follow the instructions provided in the [Google Cloud SDK documentation](https://cloud.google.com/sdk/docs/install).

3. **Set Up Billing and Create a Project**: Ensure that billing is enabled for your Google Cloud account. Create a new project for your Kubernetes cluster.

4. **Create a Kubernetes Cluster**: Use Google Kubernetes Engine (GKE) to create a Kubernetes cluster. You can do this through the Google Cloud interface by clicking on create on the cluster tab. Select the appropriate location for your cluster.

5. **Connect to the Cluster** : After the cluster is created, you need to connect to it using kubectl, the Kubernetes command-line tool.

	```bash
   gcloud container clusters get-credentials <my-cluster> --region <my-region>
6. **Add the Helm Repository** : Add the Helm repository where your Helm chart is hosted. If you have already added it previously, you can skip this step.

	```bash
   helm repo add <repo-name> https://bperraud.github.io/upylab-helm-depot/
This command configures kubectl to use the newly created cluster.


7. **Edit configuration file** : If you need to customize you can edit the values.yaml file.

	```bash
	helm show values <repo-name>/upylab > custom-values.yaml
	nano custom-values.yaml
8. **Deploy the Helm Release** : Now, you can deploy your Helm release to the Kubernetes cluster.

	```bash
   helm install <release-name> <repo-name>/upylab -f custom-values.yaml
This command configures kubectl to use the newly created cluster.

9. **Verify Deployment** : Check that your application is deployed and running correctly:

	```bash
   kubectl get pods
   kubectl get services
This will show the pods and services deployed in your cluster.



gcloud container clusters update [CLUSTER_NAME] \
    --update-addons=GcpFilestoreCsiDriver=ENABLED \
    --region=[REGION]



nb : activer Kubernetes Engine API
activer helm API ?

crd-install : kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml


dashboard :

kubectl proxy

Then open the following URL in your browser:

  http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

To get the admin user token, run:

  kubectl -n kubernetes-dashboard create token admin-user




secret :
# Generate a new CSRF token
CSRF_TOKEN=$(openssl rand -hex 32)

# Create the secret
kubectl create secret generic kubernetes-dashboard-csrf -n kubernetes-dashboard --from-literal=csrf-token="$CSRF_TOKEN"
