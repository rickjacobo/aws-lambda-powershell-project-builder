# aws-lambda-powershell-project-builder

## Description
A docker container with the dependencies required to create and publish PowerShell code to AWS Lambda. Learn more at https://github.com/rickjacobo/aws-lambda-powershell-project-builder

## Usage
- Start the container
````
docker run -dit --name powershell-builder rickjacobo/lambda-powershell-project-builder pwsh
````
- Access the container
````
docker exec -it powershell-builder pwsh
````
- Create a project
````
pwsh create-project.ps1
````
  - The create-project script will ask a few questions to assist with
    - Setting up the powershell lambda project
    - Creating an edit script
    - Creating a publish script
    - Adding your credentials via 'aws configure'
- Edit your project
````
pwsh edit.ps1
````
  - Add your powershell code to the projects powershell script
- Publish your code to lambda
````
pwsh publish.ps1
````

## Additional Resources
- [Creating a PowerShell REST API](https://aws.amazon.com/blogs/developer/creating-a-powershell-rest-api/)
