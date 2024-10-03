# Deploying UpyLab on Google Kubernetes Engine

To install a Kubernetes cluster on Google Cloud Platform (GCP) and deploy applications using Helm releases, you can follow these general steps:

1. **Create a Google Cloud Account**: If you haven't already, sign up for a Google Cloud Platform account at [Google Cloud](https://cloud.google.com/).

2. **Install and Set Up Google Cloud SDK**: Install the Google Cloud SDK, which provides the command-line interface for interacting with GCP services. Follow the instructions provided in the [Google Cloud SDK documentation](https://cloud.google.com/sdk/docs/install).

3. **Set Up Billing and Create a Project**: Ensure that billing is enabled for your Google Cloud account. Create a new project for your Kubernetes cluster.

4. **Create a Kubernetes Cluster**: Use Google Kubernetes Engine (GKE) to create a Kubernetes cluster. You can do this through the Google Cloud interface by clicking on create on the cluster tab. Select the appropriate location for your cluster.

5. **Connect to the Cluster** : After the cluster is created, you need to connect to it using kubectl, the Kubernetes command-line tool.

	```bash
   gcloud container clusters get-credentials <my-cluster> --region <my-region>

6. **Enable APIs using gcloud** : To enable the required APIs, run the following commands:

	```bash
	# kubernetes engine API
	gcloud services enable container.googleapis.com --project=YOUR_PROJECT_ID

	# certificate manager API
	gcloud services enable certificatemanager.googleapis.com --project=YOUR_PROJECT_ID
7. **Create Static IP** :

	```bash
	gcloud compute addresses create static-ip --global
	gcloud compute addresses describe static-ip --global
8. **Edit you DNS** : Configure the DNS records for your domains to point to your IP address. To find the static IP address you created, run the following command:

	```bash
	gcloud compute addresses describe ADDRESS_NAME --global
9. **Add the Helm Repository** : Add the Helm repository where your Helm chart is hosted.

	```bash
	helm repo add <repo-name> https://bperraud.github.io/upylab-helm-depot/
10. **Edit configuration file** : Edit the values.yaml file for your specific needs :

	```bash
	helm show values <repo-name>/upylab > custom-values.yaml
	nano custom-values.yaml
11. **Deploy the Helm Release** : Now, you can deploy your Helm release to the Kubernetes cluster.

	```bash
	helm install <release-name> <repo-name>/upylab -f custom-values.yaml
12. **Verify Deployment** : Check that your application is deployed and running correctly:

	```bash
	kubectl get all
13. **Wait for Google-managed certificate** to finish provisioning for the https access. This might take up to 60 minutes. You can check the status of the certificate using the following command:

	```bash
	kubectl describe managedcertificate managed-cert
# Docker setup

To run upylab in a lightweight environnement  : cd inside the docker directory and run :

	docker-compose up
---

From there the nginx container is accessible through 80 and 443 port on every interface on the host machine
