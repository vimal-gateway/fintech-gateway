# #################################
# FINTECH - GATEWAY BANKING SYSTEMS
# #################################

## **README.md (Solution Configuration Guide)**
# Fintech Platform Boilerplate

## **Overview**
This repository contains the boilerplate setup for a **next-generation fintech platform**, including **microservices, API Gateway, authentication, CI/CD pipelines, and Kubernetes deployment**.

## **Getting Started**
### **1. Clone the Repository**
```sh
git clone https://github.com/vimal-gateway/fintech-gateway.git
cd fintech-gateway
```

### **2. Setup Source code in your local system**

# Account API
```sh
cd docker/account-app
npm install
```

# Balance API
```sh
cd docker/balance-app
npm install
```

# Investment API
```sh
cd docker/investment-app
npm install
```

# Payment API
```sh
cd docker/payment-app
npm install
```

# Statement API
```sh
cd docker/statement-app
npm install
```

# Transation API
```sh
cd docker/transaction-app
npm install
```

### **Deploys Kubernetes (AKS) for microservices**
### **Creates Azure SQL Server & Cosmos DB for storage**
### **Adds Redis for caching & Key Vault for secrets**
### **Sets up Stripe Payment Gateway secrets**
### **Configures Security (Firewall, NSG)**
### **Deploys Log Analytics & App Insights for monitoring**

### **Create an AKS Cluster (if not already created)**
### **Write a Dockerfile for the Node.js application**
### **Create Kubernetes manifests (deployment.yaml, service.yaml, etc.)**
### **Set up a CI/CD pipeline in Azure DevOps (azure-pipelines.yml)**
### **Deploy the application to AKS**

### **3. Run Locally with Docker Compose**
```sh
cd fintech-gateway

docker-compose up --build
```

# Apply all Kubernetes configurations
```sh
kubectl apply -f kubernetes/deployment/
kubectl apply -f kubernetes/services/
```


# Infrastructure as Code (IAC)

# Initialize Terraform
```sh
terraform init
```

# Plan Deployment
```sh
terraform plan -out=tfplan
```

# Apply Deployment
```sh
terraform apply tfplan
```

### Thank you 