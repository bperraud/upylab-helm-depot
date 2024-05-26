# Deploying UpyLab with Helm

To install a Kubernetes cluster on Google Cloud Platform (GCP) and deploy applications using Helm releases, you can follow these general steps:

1. **Create a Google Cloud Account**: If you haven't already, sign up for a Google Cloud Platform account at [Google Cloud](https://cloud.google.com/).

2. **Install and Set Up Google Cloud SDK**: Install the Google Cloud SDK, which provides the command-line interface for interacting with GCP services. Follow the instructions provided in the [Google Cloud SDK documentation](https://cloud.google.com/sdk/docs/install).

3. **Set Up Billing and Create a Project**: Ensure that billing is enabled for your Google Cloud account. Create a new project for your Kubernetes cluster.

4. **Create a Kubernetes Cluster**: Use Google Kubernetes Engine (GKE) to create a Kubernetes cluster. You can do this through the Google Cloud Console or using the `gcloud` command-line tool.

   Here's an example command to create a basic cluster with default settings:

   ```bash
   gcloud container clusters create my-cluster
5. **Connect to the Cluster** : After the cluster is created, you need to connect to it using kubectl, the Kubernetes command-line tool.

	```bash
   gcloud container clusters get-credentials my-cluster
6. **Add the Helm Repository** : Add the Helm repository where your Helm chart is hosted. If you have already added it previously, you can skip this step.

	```bash
   helm repo add <repo-name> https://bperraud.github.io/upylab-helm-depot/upylab
This command configures kubectl to use the newly created cluster.


7. **Edit configuration file** : If you need to customize you can edit the values.yaml file.

	```bash
   nano values.yaml
7. **Deploy the Helm Release** : Now, you can deploy your Helm release to the Kubernetes cluster.

	```bash
   helm install <release-name> <repo-name>/upylab -f values.yaml
This command configures kubectl to use the newly created cluster.

8. **Verify Deployment** : Check that your application is deployed and running correctly:

	```bash
   kubectl get pods
   kubectl get services
This will show the pods and services deployed in your cluster.
