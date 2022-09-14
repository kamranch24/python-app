pipeline{
  agent any
  stages{
    stage('Build'){
      steps{
        sh 'chmod +x ./gradlew'
        
        echo 'Starting the build automation'
        sh './gradlew build_python --no-daemon'
        
      }
    }  
  
  }


}
