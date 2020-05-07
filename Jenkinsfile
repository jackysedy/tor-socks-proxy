
node {
    docker.withRegistry('https://registry-1.docker.io/v2/', 'dockerhub') {
        def customImage = docker.build("jackysedi/tor-socks-proxy:latest")
        customImage.push()
    }
    sh """
        docker-compose up -d
    """
}
