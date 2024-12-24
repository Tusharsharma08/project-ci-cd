# Flask Application Deployment with ACR and Terraform

This project demonstrates the process of building a Flask application Docker image, pushing it to Azure Container Registry (ACR), and deploying it to Azure Kubernetes Service (AKS). Terraform is used to provision the required Azure infrastructure.

```
project-ci-cd/
├── .github/
│   └── workflows/
│       └── deploy-image.yml           # GitHub workflow for building, pushing, and deploying the app
├── terraform/
│   ├── main.tf                        # Terraform configuration to create the Azure infrastructure
│   ├── variables.tf                   # Terraform variables used in the configuration
│   └── outputs.tf                     # Terraform outputs to track deployed resources
├── k8s/
│   ├── deployment.yaml                # Kubernetes deployment configuration for the Flask app
│   └── service.yaml                   # Kubernetes service configuration for the Flask app
├── app/
│   ├── Dockerfile                     # Dockerfile to build the Flask application image
│   ├── app.py                         # Main Flask application script
│   └── requirements.txt               # Python dependencies for the Flask app
```



**Workflow Overview**
1. Infrastructure Creation (Terraform):
 - First, the infrastructure is created using Terraform by running the GitHub workflow located in .github/workflows/deploy-image.yml.
 - The workflow provisions the following Azure resources:
   - Resource Group
   - Azure Container Registry (ACR)
   - Role assignments for AKS to access the ACR images
   - Azure Kubernetes Service (AKS) Cluster
   - PostgreSQL Database (for the Flask app)
 - Terraform scripts are located in the terraform/ directory, where the resources are defined.

2. Containerization & Deployment:
 - After the infrastructure is provisioned, the next step is building and deploying the Flask application. This is done by another GitHub workflow that:
   - Builds the Docker image of the Flask app from the app/ folder.
   - Pushes the image to the Azure Container Registry (ACR) created earlier.
   - Deploys the Flask app to the AKS cluster, using Kubernetes YAML files found in the k8s/ folder (deployment.yaml and service.yaml).
     
3. This process ensures that the Flask application is containerized, stored in ACR, and deployed to AKS.

**Sensitive Data Management**
- For managing sensitive data like Azure credentials, ACR login details, and any other secrets, GitHub secrets and environment variables are used in the GitHub Actions workflows.
- Secrets are securely stored in the GitHub repository’s Settings > Secrets and are accessed within the workflows for authentication and deployment tasks.
  
**Steps to Run the Project**
1. Clone the Repository:
```
git clone https://github.com/Tusharsharma08/project-ci-cd
```

2. Build and Deploy the Flask Application:
- Set up GitHub Actions workflows in your repository to trigger automatically on changes to the main branch.
- The workflow will build the Flask Docker image, push it to ACR, and deploy it to AKS.
  
3. Access the Flask Application:
- After deployment, you can access the Flask application through the external IP assigned by the AKS LoadBalancer service.

## SOC 2 Compliance
1. Access Controls

To ensure **least privilege** and prevent unauthorized access, the following measures can be implemented:

- **Role-based Access Control (RBAC)**: Implement RBAC in Azure and Kubernetes to define clear access levels for users and services. Limit permissions by assigning only necessary roles to users, groups, and service accounts.
- **System Assigned Managed Identity**: Instead of managing credentials manually, use the **System Assigned Managed Identity** for Azure resources such as AKS or Azure Functions. The identity will automatically be created and managed by Azure AD, and you can assign appropriate roles for accessing resources like Azure Key Vault or Azure Storage.
- **Service Principal Roles**: When provisioning resources via Terraform, use service principals with the least required permissions, such as the `Reader` or `Contributor` role, depending on the task. Additionally, for automated workflows, system identities provide a secure, seamless method for authentication.


I am attaching screenshots below to show the successful creation of the resources in Azure. You can also refer to the GitHub Actions workflow jobs to understand the steps involved in provisioning the infrastructure and deploying the Flask application.

<img width="1429" alt="Screenshot 2024-12-25 at 1 09 41 AM" src="https://github.com/user-attachments/assets/ff097430-f026-4de1-8025-0bbff8f86750" />
<img width="1440" alt="Screenshot 2024-12-25 at 1 09 54 AM" src="https://github.com/user-attachments/assets/074dee05-d4c2-4c56-9842-29e930305172" />
<img width="1746" alt="Screenshot 2024-12-25 at 1 10 40 AM" src="https://github.com/user-attachments/assets/f0c0af78-aa0d-4793-be87-44c9ecbd8e0d" />

**Conclusion**

This project demonstrates how to integrate Terraform, Docker, Azure Kubernetes Service, and Azure Container Registry in a CI/CD pipeline for automating the deployment of a Flask application. By utilizing GitHub Actions and Terraform, the entire infrastructure setup and application deployment process is streamlined and automated.



