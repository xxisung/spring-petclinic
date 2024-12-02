pipeline {
  agent any

  tools {
    jdk 'jdk17'
    maven 'M3'
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

    
    

  }
}
