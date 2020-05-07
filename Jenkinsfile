pipeline {
    agent any
    stages {
        stage("check branches"){
            steps{
                sh """
                    echo "hello"
                    sudo docker build -t .
                """
            }
        }
    }
}
