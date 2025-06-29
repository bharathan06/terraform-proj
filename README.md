# terraform
Proof of work for terraform knowledge 

Folder structure : 
tf-azure-3tier/
├─ modules/
│  ├─ network/
│  ├─ compute/
│  └─ database/
├─ envs/
│  └─ dev/
│      ├─ main.tf
│      ├─ variables.tf
│      ├─ outputs.tf
│      └─ backend.tf
├─ .gitignore
└─ README.md

- terraforms azurerm uses azure credentials to call the azure rest api, now terraform can access my azure acount 
- first i created an azure resource group named rg-tfstate because in order to hold the stoarge account, i need a rg 
- now within the resource group, i made initialized a blob storage so i can host the storage account to the blob 
- once i got the key and created the blob container, i created the backend.tf file with all the configuration details (writen in hashcorp configuration language)
- SO basically what ive done so far is to give terraform the exact idea of : 
    which resource group to check , storage account name, container name and key name
- Now i executed the command "terraform init". With the execution of this command, the backend.tf script gets executed and creates the remote state location 
- The reason i am using a remoate state to store the state of my tf is so that there can be ease of collaboration in teams 


azureRM provider : 
    - This is a tool that talks to the azure REST api to allocate resources 

azurerm backend : 
    - The mechanism that manages how the terrform state file is stored and updated in azure blob storage. 

State file : 
    - The file that consists of the current state of the infrastructure. This file is stored as an object in the blob storage. Extension is .tfstate file. 

- All the other team memebers will pull the latest state from the blob storage and make changes to maintain collaboration and versioning. 