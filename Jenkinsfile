
node {
    docker.withRegistry('https://registry-1.docker.io/v2/', 'dockerhub') {
        def customImage = docker.build("jackysedi/tor-socks-proxy:${env.BUILD_ID}")
        customImage.push()
    }
    sh """
        docker stop tor-socks-proxy
        docker rm tor-socks-proxy
        docker run -d --restart=always --name tor-socks-proxy -p 127.0.0.1:9150:9150  registry-1.docker.io/jackysedi/tor-socks-proxy:${env.BUILD_ID}
    """
}
