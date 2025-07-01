# Task B 

## Prerequisites
- Self Hosted Azure Agent in the Vnet
- Azure CLI
- Terraform 
- Helm 
- kubectl
- ACR repo to store your Container images
- Azure DevOps Repo
- CI/CD pipeline
- Azure repo/ Github Repo
- Helm charts
- Dockerfile for application
- Manifest files for k8s
- Service connections for ACR, AKS

# Steps for setting up Infra
1. First we will run infra pipeline to create RG and ACR using ARM templates. And we will publish the Artifact in default folder which will include the terraform code.
2. Then we will create a release pipeline, in which we will add steps/tasks to create a AKS cluster.
3. In release pipeline, first we will download the artifacts of the build pipeline,then we will add a terraform task to initialize the terraform working directory.
4. we will have to do the configuration of terraform like backend service connection, resource group, container, storage, state file path.
5. Then we will add terraform validate command.
6. Terraform plan to create a plan before actually applying our changes to the infra.
7. Then we will add task to run the terraform apply -auto-approve or additionally we can add approvers name



Commands used for terraform
terraform init
terraform validate
terraform plan tfplan.out 
terraform apply tfplan


# CI/CD implemetation for Deployment of Front end and Backend Services on AKS using Helm charts.

1. Developer will push the code into the repo using PR.
2. Azure Build Pipeline will trigger the build. It will build the docker image and publish that image to ACR. Additonally it will publish K8s manifest and Helm charts as artifacts.
3. In Azure DevOps Release Pipeline, We will download artifacts and create different stages for each env like dev, qa , prod. 
4. Then We will use Helm deploy to AKS function in each stage. Using this it will deploy the service and deployment on AKS cluster.

Comands for Helm
helm install myapp ./helm-chart
helm upgrade --install myapp ./helm-chart
helm upgrade --install myapp ./helm-chart -f ./helm-chart/values-qa.yaml
