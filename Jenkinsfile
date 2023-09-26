pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

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

        stage("Building Docker Image"){
            steps{
                echo "Creating Docker Image"
                sh "docker build -t ssah6694/banking-project:1.0 ."
            }
        }

        stage("pushing images to dockerhub"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'credentials', passwordVariable: 'dockerhub_password', usernameVariable: 'dockerhub_user')]) {
                sh "docker login -u ${dockerhub_user} -p ${dockerhub_password}"
                    }
                sh "docker push ssah6694/banking-project:1.0"
            }
        }
    }
}