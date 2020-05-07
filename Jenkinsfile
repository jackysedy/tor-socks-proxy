pipeline {
    agent any
    stages {
        stage("check branches"){
            steps{
                dockerImage = docker.build("tor-socks-proxy")
                sh """
                    
                    docker login --username=jackysedi --email=jacky.sedi@hotmail.com
                    docker build -t tor-socks-proxy .
                    docker push
                """
            }
        }
    }
}
