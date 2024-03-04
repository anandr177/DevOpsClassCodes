pipeline{
    agent any
    tools{
        maven 'MyMaven'
    }
     environment {     
        DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')     
    } 
    stages{
        stage("checkout"){
            steps{
                git branch: 'master',
                url:'https://github.com/anandr177/DevOpsClassCodes.git'
                echo 'pulled from github successfully'
            }
        }
        stage("compile"){
            steps{
                sh "mvn compile"
                echo 'converted the code from human readable to machine readable '
            }
        }
        
        stage("package"){
            steps{
                sh "mvn  package"
                echo 'convert the files to war file'
            }
        }
        stage("docker image"){
            steps{
                sh "docker build -t anandr177/addressbook:v1 ."
                echo 'generate the docker image'
            }
        }
        stage("push image to docker "){
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                echo 'logged into docker hub'
                sh "docker push anandr177/addressbook:v1"
                echo 'pushed docker image to docker hub'
            }
        }
    }
}
