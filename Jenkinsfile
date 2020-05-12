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
       jobId: "399edaf2-b971-494e-aa27-7827e208644d",
       shouldFailTheBuild: true,
       shouldWaitForRundeckJob: true,
       tailLog: true])
     }
   }
  } 
  }

}
