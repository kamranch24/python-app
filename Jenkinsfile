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
                    app=docker.build("sample-python")
                                     
                    }    
            }
                  
        } 
       stage('Push Docker Image') {
            
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/', 'dockerHubCred') {
                        sh 'docker push sample-python:$BUILD_NUMBER'
                        sh 'docker push sample-python:latest'


                    }
                }
            }
        }
  
  }


}
