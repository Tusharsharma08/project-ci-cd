# Flask Application Deployment with ACR and Terraform

This project demonstrates the process of building a Flask application Docker image, pushing it to Azure Container Registry (ACR), and deploying it to Azure Kubernetes Service (AKS). Terraform is used to provision the required Azure infrastructure.

Here we have 2 workflows, one terraform folder and 

.
   * [.github](./.github)
     * [deploy-image.yml](./.github/deploy-image.yml)
     * [terraform-deploy.yml](./.github/terraform-deploy)
   * [app](./app)
     * [DOckerfile](./dir2/file21.ext)
     * [file22.ext](./dir2/file22.ext)
     * [file23.ext](./dir2/file23.ext)
   * [dir1](./dir1)
     * [file11.ext](./dir1/file11.ext)
     * [file12.ext](./dir1/file12.ext)
   * [file_in_root.ext](./file_in_root.ext)
   * [README.md](./README.md)
   * [dir3](./dir3)

project-root/ 
├── app/ 
│ ├── init.py 
│ ├── main.py 
│ └── models.py 
├── k8s/ 
│ ├── deployment.yaml 
│ └── service.yaml 
├── docs/ 
│ └── README.md 
├── .gitignore └── README.md
