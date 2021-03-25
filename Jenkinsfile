pipeline {
  agent any 
  stages {
    stage('Build') {
      steps {
        bat "mvn compile"
      }
    }  
    stage('Test') {
      steps {
        bat "mvn test"
      }
     post {
      always {
        junit '**/TEST*.xml'
      }
     }
  }
  stage('newman') {
     steps {
       bat 'newman run Restful_Booker_Ruiling.postman_collection.json --environment Restful_Booker_Ruiling.postman_environment --reporters junit'
     }
     post {
        always {
          junit '**/*xml'
        }
     }
  }
  stage('Robot Framework System tests with Selenium') {
     steps {
          bat 'robot --variable BROWSER:headlesschrome -d Results  Tests'
          }
          post {
             always {
                 script {
                      step(
                         [
                          $class              : 'RobotPublisher',
                           outputPath          : 'results',
                           outputFileName      : '**/output.xml',
                           reportFileName      : '**/report.html',
                           logFileName         : '**/log.html',
                           disableArchiveOutput: false,
                           passThreshold       : 50,
                           unstableThreshold   : 40,
                           otherFiles          : "**/*.png,**/*.jpg",
                         ]
                      )
                 }
             }
          }
  }
 }
}
