pipeline {
    agent any
    stages {
        stage("clone code"){
            steps{
                //enable remote triggers
                script {
                    properties([pipelineTriggers([pollSCM('* * * * *')])])
                }
               git branch: 'main', url: 'https://github.com/chifuwang/springbootdemo.git'
            }
        }
        stage("build code"){
            steps{
              bat 'mvn clean package'
            }
        }
        stage("create Docker image"){
            steps{
              powershell 'docker build -t privaterepo:18082/springbootdemo .'
            }
        }
        stage("remove existing container"){
            steps{
              powershell 'docker rm -f springbootdemo && "container springbootdemo removed" || "container springbootdemo does not exist"'
            }
        }
        stage("run container"){
            steps{
              powershell 'docker run -d --name springbootdemo -p 28080:8080 privaterepo:18082/springbootdemo'
            }
        }
        stage("push Docker image to private registry"){
            steps{
              powershell 'docker push privaterepo:18082/springbootdemo'
            }
        }
    }
}
