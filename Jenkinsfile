pipeline {
  agent none
  stages {
    stage('01-Build') {
      agent {
        docker {
          image 'gradle:8.13.0-jdk17-corretto'
        }

      }
      steps {
        echo 'Step 1: Build'
        sh 'gradle clean jar'
      }
    }

    stage('02-Test') {
      agent {
        docker {
          image 'gradle:8.13.0-jdk17-corretto'
        }

      }
      steps {
        echo 'Step 2: Test'
        sh 'gradle clean test'
        archiveArtifacts 'build/reports/tests/test/*'
      }
    }

    stage('03-Package') {
      agent {
        docker {
          image 'gradle:8.13.0-jdk17-corretto'
        }

      }
      steps {
        echo 'Step 3: Package'
        sh 'gradle clean -x test -PcommitId=$GIT_COMMIT jar'
        archiveArtifacts 'build/libs/*'
      }
    }

    stage('DockerImage') {
      steps {
        sh 'docker build -t myjenkproj:v1 .'
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