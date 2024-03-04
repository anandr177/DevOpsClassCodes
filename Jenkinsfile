pipeline{
    agent any
    tools{
        maven 'MyMaven'
    }
    stages{
        stage("checkout from github"){
            steps{
                git branch: 'master',
                url:'https://github.com/anandr177/DevOpsClassCodes.git'
                echo 'pulled from github successfully'
            }
        }
        stage("compile the code to executable format"){
            steps{
                sh "mvn compile"
                echo 'converted the code from human readable to machine readable '
            }
        }
        stage("testing the code"){
            steps{
                sh "mvn test"
                echo 'run and execute the test cases'
            }
        }
        stage("code review to check quality of code"){
            steps{
                sh "mvn pmd:pmd"
                echo 'code review done'
            }
        }
        stage("convert the code to package"){
            steps{
                sh "mvn  package"
                echo 'convert the files to war file'
            }
        }
    }
}
