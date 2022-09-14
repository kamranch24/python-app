pipeline{
  agent any
  stages{
    stage('Build'){
      steps{
        
        echo 'Starting the build automation'
        sh './gradlew build_python --no-daemon'
        
      }
    }  
  
  }


}
