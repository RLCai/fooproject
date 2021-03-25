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
  stage('Robot Framework System tests with Selenium') {
     steps {
          sh 'robot --variable BROWSER:headlesschrome -d Robotfiles/Results  Robotfiles/Tests'
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
