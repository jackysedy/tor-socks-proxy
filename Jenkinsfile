pipeline {
    agent any
    stages {
        stage("check branches"){
            steps{
                sh """
                    echo "hello"
                    docker build -t tor-socks-proxy .
                """
            }
        }
    }
}
