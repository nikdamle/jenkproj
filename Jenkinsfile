pipeline {
  agent any
  stages {
    stage('01-Build') {
      steps {
        echo 'Step 1: Build'
        sh 'gradle jar'
      }
    }

    stage('02-Test') {
      steps {
        echo 'Step 2: Test'
        sh 'gradle test'
      }
    }

    stage('03-Package') {
      steps {
        echo 'Step 3: Package'
        sh 'gradle -x test -PcommitId=$GIT_COMMIT jar'
        archiveArtifacts 'build/libs/*'
      }
    }

  }
  tools {
    gradle 'Gradle8.3'
  }
  post {
    always {
      echo 'This pipeline is completed..'
    }

  }
}