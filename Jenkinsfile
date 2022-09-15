pipeline{
   
   agent any
    stages{
    stage('Build'){
      steps{
         sh 'sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce'
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
