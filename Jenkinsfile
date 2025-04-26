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
      agent any
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerlogin'){
            def commitHash = env.GIT_COMMIT.take(7)
            def dockerImage = docker.build("ndamle/myjenkproj:${commitHash}", "./")
            dockerImage.push()
            dockerImage.push("latest")
            dockerImage.push("dev")
          }
        }

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