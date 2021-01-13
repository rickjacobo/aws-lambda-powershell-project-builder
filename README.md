# aws-lambda-powershell-project-builder

## Background

I've been working with PowerShell since its beginning and haven't looked back since. Last year, while working on an serverless project for work, I decided to try Lambda on my own and deploy some of my PowerShell code to AWS to see how it works. 

Fast forward to now...I quit my day job and started working more with AWS on my own while studying for some certs. I jumped back into Lambda and was reminded of how tedious it is to setup my environment for publishing PowerShell to AWS. Unfortunately, I didn't take any notes last year and wanted an easier way to ensure I could just focus on the code. That is where Docker comes in to save the day and our story begins - I created a Docker container with the dependencies required to publish PowerShell code to AWS. I also threw in a few helpful scripts to get a project up and running as quickly as possible. 



## See It In Action

[![YouTube](http://img.youtube.com/vi/jHd2FU3ISIs/0.jpg)](https://youtu.be/jHd2FU3ISIs)


## How Do I Get Started

### Assumptions

- An AWS Account and access to you "Access Key Id" and "Secret Access key"
- Docker or Docker Desktop

- Some Docker know how

If you are lacking in either of those areas head over to the Docker and learn how to [Get Started](https://www.docker.com/get-started)!



### Process

1. Start the container

   ````
   docker run -dit --name powershell-builder rickjacobo/lambda-powershell-project-builder
   ````

2. Access the container shell

   ````
   docker exec -it powershell-builder pwsh
   ````

3. Create a project

   ````
   ./create-project.ps1
   ````

   - The create-project script will ask a few questions during setup to assist with
     - Setting up the PowerShell Lambda Project
     - Creating a script to edit your PowerShell code
     - Creating a script to publish your PowerShell
     - Adding your AWS credentials via the 'aws configure' cli

4. Add code to your project

   ````
   ./edit-<projectname>.ps1
   ````

   - This is the same as running

     ````
     vi /<projectname>/<projectname>.ps1
     ````

If you don't have any code readily available feel free to append the code below to <projectname>.ps1.

````
$Json = @"
{
     "Message":"Hello, World!"
}
"@

$Json
````



5. Publish your code to AWS

   ````
   ./publish-<projectname>.ps1
   ````



That's it - the container abstracts a lot of the complexity of getting started with PowerShell on AWS Lambda. Hopefully, this quick tutorial will help you to give AWS Lambda a try.



## Project Notes

- The lambda-powershell-project-builder container has all the dependencies required to get started quickly with PowerShell on AWS Lamb
- The create-project.ps1 script runs the Publish-AWSPowerShellLambda command with the values collected during the script execution and creates the edit and publish scripts on the fly based on your answers. Finally, it launches the 'aws configure' cli command for so you can enter your aws "Access Key Id" and "Secret Access key" which is required for publishing your Lambda application.
- The publish-<project>.ps1 script run the Publish-AWSPowerShellLambda script with some sensible defaults



## Project Links

- [Github](https://github.com/rickjacobo/aws-lambda-powershell-project-builder)
- [Dockerhub](https://hub.docker.com/u/rickjacobo)



## Additional Links

- [Get Started with AWS Lambda](https://aws.amazon.com/lambda/)
