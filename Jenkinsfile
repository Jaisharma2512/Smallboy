pipeline{
agent any
environment{
        PROJECT_ID = 'secure-air-461520-g7'
        CLUSTER_NAME = 'july-cluster'
        REGION = 'us-central1'
        IMAGE_TAG = "${env.BUILD_NUMBER}"
}
stages{
    stage('Checkout'){
            steps{
                    git branch: 'k8s-resources' , url: 'https://github.com/Jaisharma2512/Smallboy.git'
           }

    }
 stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Build & Push Frontend') {
            steps {
                sh '''
                    docker build -t danklofan/smallboy-client:$IMAGE_TAG ./frontend
                    docker push danklofan/smallboy-client:$IMAGE_TAG
                '''
            }
        }

        stage('Build & Push Backend') {
            steps {
                sh '''
                    docker build -t danklofan/smallboy-server:$IMAGE_TAG ./backend
                    docker push danklofan/smallboy-server:$IMAGE_TAG
                '''
            }
        }

stage('Apply Terraform - Create Cluster') {
            steps {
                sh '''
                    cd terraform
                    terraform apply -auto-approve
                '''
            }
        }

        stage('Configure kubectl') {
            steps {
                sh '''
                    cd terraform
                    eval $(terraform output -raw kubeconfig_command)
                '''
            }
        }

        stage('Update YAMLs with Image Tags') {
            steps {
                sh '''
                    sed -i "s|danklofan/smallboy-client:.*|danklofan/smallboy-client:$IMAGE_TAG|" k8s/03-deployment-frontend.yaml
                    sed -i "s|danklofan/smallboy-server:.*|danklofan/smallboy-server:$IMAGE_TAG|" k8s/04-deployment-backend.yaml
                '''
            }
        }

        stage('Deploy to GKE') {
            steps {
                sh '''
                    kubectl apply -f k8s/
                '''
            }
        }
    }

    post {
        always {
            echo '✅ Full CI/CD pipeline complete'
        }
    }
}
 