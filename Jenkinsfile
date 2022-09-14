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
