pipeline {
  agent any

  tools {
    jdk 'jdk17'
    maven 'M3'
  }

  //Docker Hub 접속 정보
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerCredentials')
  }

  stages {
    // GitHub에서 Jenkins로 소스코드 복사
    stage('Git Clone') {
      steps{
        git url: 'https://github.com/xxisung/spring-petclinic.git', branch: 'main'
        
      }     
    }
    stage('Maven Build') {
      steps {
        sh 'mvn -Dmaven.test.failure.ignore=true clean package'
      }
    }
    stage('Docker Image') {
      steps{
        dir("${env.WORKSPACE}"){
          sh """
          docker build -t jsyw/spring-petclinic:$BUILD_NUMBER .
          docker tag jsyw/spring-petclinic:$BUILD_NUMBER jsyw/spring-petclinic:latest
          """
          }
        }      
      }      

      stage('Docker Image Push') {
      steps {
      sh """
      echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
      docker push jsyw/spring-petclinic:latest
      """
      }
    }  
       

  }
}
