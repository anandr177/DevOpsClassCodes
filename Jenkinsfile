pipeline{
    agent any
    tools{
        maven 'MyMaven'
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
                withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhub-pwd')]) {
                sh "docker login -u anandr177 -p ${dockerhub-pwd}"
                }
                sh "docker push anandr177/addressbook:v1"
                echo 'pushed docker image to docker hub'
            }
        }
    }
}
