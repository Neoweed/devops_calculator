#!groovy
pipeline {
  agent any
  stages 
    {
    stage('Clean') {
      steps {
        sh 'mvn clean package -DskipTests'
      }
    }
    stage('Build docker images') {
      steps {
        sh 'docker build -t akhilank1937/akhilbuild:1.0 .'
      }
    }
    stage('Docker Hub') {
      steps 
      {
        withDockerRegistry([credentialsId: 'DockerHub', url:""])
        {
          sh 'docker push akhilank1937/akhilbuild:1.0'
        }
      }
    }
   stage('Execute Rundeck job') {
   steps {
     script {
       step([$class: "RundeckNotifier",
       includeRundeckLogs: true,
       rundeckInstance: "rundeck",
       jobId: '90382f00-1180-4c7c-9bae-1b43dd702af1',
       shouldFailTheBuild: true,
       shouldWaitForRundeckJob: true,
       tailLog: true])
     }
   }
  } 
  }

}
