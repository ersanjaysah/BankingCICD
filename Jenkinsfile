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

        stage('HTML Report by TestNG'){
            steps {
                echo "Creating Test Report by testNG"
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/BankingProject/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
        }
    }
}