
node {
    git credentialsId: 'cced35f3-1bac-42ef-81d3-960072464a3b', url: 'https://github.com/jackysedy/tor-socks-proxy'
    docker.withRegistry('https://registry-1.docker.io/v2/', 'dockerhub') {
        def customImage = docker.build("jackysedi/tor-socks-proxy:latest")
        customImage.push()
    }
    step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StartAllServices'], useCustomDockerComposeFile: false])

}
