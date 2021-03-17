pipeline {
  environment {

    registry = "debaduttapradhan1996/devops-project"

    registryCredential = 'docker_hub_debadutta'

    dockerImage = ''

  }

  agent any

  stages{

    stage ('Build Docker Image') {
      steps{
        echo "Building Docker Image"
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage ('Push Docker Image') {
      steps{
        echo "Pushing Docker Image"
        script {
          docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
              dockerImage.push('latest')
          }
        }
      }
    }
   stage ('Deploy images and Remove unused Docker Image') {
      steps{
        echo "Removing Docker Image"
        sh "docker rmi $imagename:$BUILD_NUMBER"
	sh "docker rmi $imagename:latest"
        }
      }

   stage ('Deploy image') {
      steps{
        echo "Deploying to Dev Environment"
        sh "docker rm -f devops|| true"
        sh "docker run -d --name=devops -p 80:80 debaduttapradhan1996/devops-project"
      }
     }
    }
  }

