pipeline{
    agent any

    environment{
        IMAGE_NAME="docker-pytest-app"
    }
    stages{
        stage ("Checkout"){
            steps{
                checkout scm
            }
        }
        stage ("Build docker image"){
            steps{
                echo "Building docker image- $IMAGE_NAME"
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage ("Run pytest in container"){
            steps{
                echo "Running pytest in container"
                sh 'docker run -v .:/app $IMAGE_NAME'
            }
        }
        stage ("Copy report"){
            steps{
                echo "Copying HTML report"
                sh 'cp report.html report.html'
            }
        }
        stage ("Publish HTML report"){
            steps{
                publishHTML target: [
                    reportDir: '.',
                    reportFiles: 'report.html',
                    reportName: 'HTML report'
                ]
            }
        }
    }
}