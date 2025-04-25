pipeline {
  agent any
  stages {
    stage('01-Build') {
      steps {
        echo 'Step 1: Build'
        sh 'gradle clean jar'
      }
    }

    stage('02-Test') {
      steps {
        echo 'Step 2: Test'
        sh 'gradle clean test'
      }
    }

    stage('03-Package') {
      steps {
        echo 'Step 3: Package'
        sh 'gradle clean -x test -PcommitId=$GIT_COMMIT jar'
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