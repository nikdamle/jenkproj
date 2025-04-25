pipeline {
	agent any
	
	tools{
		gradle 'Gradle8.3'
	}
	
	stages{
		stage("01-Build"){
			steps{
				echo 'Step 1: Build'
				sh 'gradle --version' 
			}
		}
		stage("02-Test"){
			steps{
				echo 'Step 2: Test'
			}
		}
		stage("03-Package"){
			steps{
				echo 'Step 3: Package'
			}
		}
	}
	
	post{
		always{
			echo 'This pipeline is completed..'
		}
	}
}