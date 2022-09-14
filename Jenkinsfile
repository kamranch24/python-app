pipeline{
  agent any
  stages{
    stage('Build'){
      steps{
        sh 'chmod +x ./gradlew'
        
        echo 'Starting the build automation'
        sh './gradlew build_pythons --no-daemon'
        
      }
    }
   
        stage('Build Docker Image'){
            
            steps{
               sh ' wget https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz  \
                  && tar xzvf docker-17.04.0-ce.tgz \
                  && mv docker/docker /usr/local/bin \
                  && rm -r docker docker-17.04.0-ce.tgz'
                script{
                    app=docker.build("kamranch24/sample-python")
                   
                    }    
            }
                  
        }
         stage('Push Docker Image') {
            
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DockerCred') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }  
  
  }


}
