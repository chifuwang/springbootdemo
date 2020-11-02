pipeline {
    agent any
    stages {
        stage("clone code"){
            steps{
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
              bat 'docker build -t privaterepo:18082/springbootdemo .'
            }
        }
        stage("remove existing container"){
            steps{
              bat 'docker rm -f springbootdemo && "container springbootdemo removed" || "container springbootdemo does not exist"'
            }
        }
        stage("run container"){
            steps{
              bat 'docker run -d --name springbootdemo -p 28080:8080 privaterepo:8082/springbootdemo'
            }
        }
        stage("push Docker image to private registry"){
            steps{
              bat 'docker push privaterepo:18082/springbootdemo'
            }
        }
    }
}
