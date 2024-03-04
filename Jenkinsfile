pipeline{
    agent any
    tools{
        maven 'MyMaven'
    }
     environment {     
        DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')     
    } 
    stages{
        stage("Checkout"){
            steps{
                git branch: 'master',
                url:'https://github.com/anandr177/DevOpsClassCodes.git'
                echo 'pulled from github successfully'
            }
        }
        stage("Compile"){
            steps{
                sh "mvn compile"
                echo 'converted the code from human readable to machine readable '
            }
        }
        stage("Test"){
            steps{
                sh "mvn test"
                echo 'run and execute the test cases'
            }
        }
        stage("Code Review"){
            steps{
                sh "mvn pmd:pmd"
                echo 'code review done'
            }
        }
        stage("Package"){
            steps{
                sh "mvn  package"
                echo 'convert the files to war file'
            }
        }
        stage("Create docker image"){
            steps{
                sh "docker build -t anandr177/addressbook:v1 ."
                echo 'generate the docker image'
            }
        }
        stage("Push image to docker hub"){
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                echo 'logged into docker hub'
                sh "docker push anandr177/addressbook:v1.${BUILD_NUMBER}"
                echo 'pushed docker image to docker hub'
            }
        }
        stage("Launch container"){
            steps{
                sh "docker run -d -it --name addressbook -p 8181:8080 anandr177/addressbook:v1.${BUILD_NUMBER}"
                echo 'deployed docker image as a container'
            }
        }
    }
}
