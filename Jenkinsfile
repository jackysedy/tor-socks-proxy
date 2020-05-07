pipeline {
    agent any
    stages {
        stage("check branches"){
            steps{
                sh """
                    dockerImage = docker.build("tor-socks-proxy")
                    docker login --username=jackysedi --email=jacky.sedi@hotmail.com
                    docker build -t tor-socks-proxy .
                    docker push
                """
            }
        }
    }
}
