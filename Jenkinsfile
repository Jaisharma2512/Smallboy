pipeline{
agent any
environment{
    PROJECT_ID = 'secure-air-461520-g7'
    CLUSTER_NAME = 'july-cluster'
    CLUSTER_REGION = 'us-central1'
    DOCKER_IMAGE_FRONTEND = 'danklofan/smallboy-client'
    DOCKER_IMAGE_BACKEND = 'danklofan/smallboy-server' 
    IMAGE_TAG = "build-${env.BUILD_NUMBER}"
    CREDENTIALS_ID = 'gcp_creds'
}
stages{
    stage('Checkout'){
            steps{
                    git branch: 'k8s-resources' , url: 'https://github.com/Jaisharma2512/Smallboy.git'
           }

    }
    stage('BUILD DOCKER IMAGES'){
           steps{
               script{
                sh 'docker build -t $DOCKER_IMAGE_BACKEND:$IMAGE_TAG ./server'
                sh 'docker build -t $DOCKER_IMAGE_FRONTEND:$IMAGE_TAG ./client'
               }
           }
    }

    Stage('loging to dkrhub'){
        
    }

    stage('Deploy'){
           steps{

           }
    }
}
}