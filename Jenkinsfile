pipeline {
//None parameter in the agent section means that no global agent will be allocated for the entire Pipeline’s
//execution and that each stage directive must specify its own agent section.
    agent {docker 
           {
               //image 'ginglove/docker_robot_python_37:1.0.1'
               image '10.1.66.33:8083/robot:v1.1'
               registryUrl 'http://10.1.66.33:8083'
               registryCredentialsId 'nexus_admin'
               args '-u root --privileged'
           }
          }
    stages {
        stage('Check Dependencies Requirement') {
            steps {
                sh  'echo "test"'
                sh  'google-chrome --version'
                sh  'chromedriver --version'
                sh  'pip3.7 --version'
            }
        }
        stage('Running Robot Script'){
            steps{ 
                sh 'echo "Run Robot Script for Automation"'
                sh 'ls -al ./6_scripts'
                sh 'sh 6_scripts/run.sh'
                script {
                  step(
                    [
                      $class                    : 'RobotPublisher',
                      outputPath                : '7_results',
                      outputFileName            : "output.xml",
                      reportFileName            : "report.html",
                      logFileName               : "log.html",
                      disableArchiveOutput      : false,
                      passThreshold             : 100,
                      unstableThreshold         : 95.0,
                      otherFiles                : "*.png"
                    ]
                  )
                }                
            }            
        }
    }   
}
