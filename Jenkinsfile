
node {
    docker.withRegistry('https://hub.docker.com', 'dockerhub') {
        def customImage = docker.build("tor-socks-proxy:${env.BUILD_ID}")
        customImage.push()
    }
}
