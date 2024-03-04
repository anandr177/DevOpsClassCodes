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
        stage("test"){
            steps{
                sh "mvn test"
                echo 'run and execute the test cases'
            }
        }
        stage("code review"){
            steps{
                sh "mvn pmd:pmd"
                echo 'code review done'
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
                sh "sudo docker build -t anandr177/addressbook:v1"
                echo 'generate the docker image'
            }
        }
    }
}
