pipeline{
   
   agent any
    stages{
    stage('Build'){
      steps{
        sh 'echo $PATH'
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
                    docker.withRegistry('https://hub.docker.com', 'dockerHubCred') {
                        sh 'docker push kamranch24/sample-python:$BUILD_NUMBER'
                        sh 'docker push kamranch24/sample-python:latest'

                    }
                }
            }
        }
  
  }


}
