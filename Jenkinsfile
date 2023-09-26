pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                echo 'Cloning the Project from Github to Jenkins Workspace'
                git 'https://github.com/ersanjaysah/BankingCICD.git'
            }
        }

        stage('Build the Application'){
            steps {
                echo "Cleaning >> Compiling >> Testing >> Packaging"
                sh "mvn clean package"
            }
        }
    }
}