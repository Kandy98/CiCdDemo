#!groovy
pipeline { 
    agent any
    stages {
        stage('Preparation') {
            steps {
                checkout scm
            }
        }
        
        stage('Test') {
            steps {
                bat "dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=opencover"
            
            }
        }
        stage('SonarQube') {
            steps {
                withSonarQubeEnv('sonarqube') {
                     
                    bat "dotnet build-server shutdown"
                    bat """dotnet SonarScanner begin /k:FirstCoreProject /d:sonar.host.url=http://localhost:9000 /d:sonar.login="7ccdc841587f0c93416a8841b54fa9d10b1c3df4" /d:sonar.cs.opencover.reportsPaths="./FirstCoreProject/coverage.opencover.xml" /d:sonar.coverage.exclusions="**Test*.cs"""
                    bat "dotnet build FirstSolution.sln"
                    bat """dotnet SonarScanner end /d:sonar.login="7ccdc841587f0c93416a8841b54fa9d10b1c3df4"""
                    
                }
            }
        }
        stage("Quality Gate") {
            steps {
              timeout(time: 5, unit: 'MINUTES') {
                waitForQualityGate abortPipeline: true
              }
            }
        }

        stage('Build') {
            steps {
                bat "dotnet build"
            }
        }

        stage('Run') {
            steps {
                
                bat "cd FirstCoreProject"
                bat "dotnet run --project FirstCoreProject"
            }
        }
        
        stage('Publish'){
            steps{
                bat "dotnet publish -c release -r ubuntu.18.04-x64 --self-contained"
                bat "cd FirstCoreProject/bin/Release/netcoreapp3.1/ubuntu.18.04-x64/"
                zip zipFile: 'publish.zip', archive: false, dir: './FirstCoreProject/bin/Release/netcoreapp3.1/ubuntu.18.04-x64/publish'
            }
        }
        
        stage('deploy') {
            steps{
                bat "scp -i C:/Users/kanverma/.jenkins/workspace/pod1-demo/key1247 publish.zip kanverma@52.149.213.188:/home/kanverma/"
                echo 'file copied'
                
            }
        }
    }
    post {  
        always {  
            echo 'Build Result:'  
        }  
        success {  
            echo 'The .net build was successful !'  
        }  
        failure {  
            echo 'The .net build failed !'
        }    
    }
}
