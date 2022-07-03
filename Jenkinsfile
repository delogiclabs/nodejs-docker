String appName = 'tbdocker'
String appPort = 8108
String appVersion = '1.1.0'

node {
	stage('Install node modules') {
		docker.image('node:14').inside('-u 0:0') {
			sh("npm install")
			sh("sed -i \"s/app_version/${appVersion}/g\" server.js")
			sh("tar cvzf ${appName}-${appVersion}-${env.BUILD_NUMBER}.tar.gz node_modules/")
			//stash includes: '*.tar.gz', name: 'artifact'
    	}
		archiveArtifacts artifacts: '*.tar.gz', fingerprint: true
	}
//    stage('Build Docker image') {
//		withCredentials([string(credentialsId: 'github_pwd', variable: 'github_pwd')]) {
//			withEnv(['CI=true']) {
//				sh("docker login -u <user> -p ${github_pwd}")
//				sh """
//					docker build -t ${appName}:${appVersion} .
//					docker tag ${appName}:${appVersion} <user>/${appName}:${appVersion}
//					docker tag ${appName}:${appVersion}  <user>/${appName}:latest

//					docker push <user>/${appName}:${appVersion}
//					docker push <user>/${appName}:latest
//				"""
//			}
//		}
//	}

//    stage('Remove unused Docker image(s)') {
//  		sh("docker rmi <user>/${appName}:${appVersion}")
//	    sh("docker rmi <user>/${appName}:latest")
//	}
//    cleanWs()

}
