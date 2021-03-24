pipeline {
  agent any 
  stages {
    stage('Build') {
      steps {
        sh "mvn compile"
      }
    }  
    stage('Test') {
      steps {
        sh "mvn test"
      }
     post {
      always {
        junit '**/TEST*.xml'
      }
     }
  }
  stage('newman') {
     steps {
       sh 'newman run Restful_Booker_Ruiling.postman_collection.json --environment Restful_Booker_Ruiling.postman_environment --reporters junit'
     }
     post {
        always {
          junit '**/*xml'
        }
     }
  }
 }
}
