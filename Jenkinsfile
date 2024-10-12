node{
    
    def mavenHome = tool name: "maven-3.8.5"
    
    // Git checkout stage 
    
    stage('CheckoutCode'){
        git branch: 'development', credentialsId: 'Jenkins', url: 'https://github.com/msdeepak052/java-deepak-webapp.git'
    }
    
    // Build stage
    
    stage('Build Maven'){
        sh "$mavenHome/bin/mvn clean package"
        sh "chmod -R 777 target/"
    }
    
    //SonarQube Report
    
    stage('SonarQubeReport'){
        sh "$mavenHome/bin/mvn sonar:sonar"
    }
    
    //Upload to Nexus Repository
    
    stage('NexusRepoUpload'){
        sh "$mavenHome/bin/mvn deploy"
    }
    
    //Deploy artifact to Tomcat Server
    
    stage('DeployToTomcatServer'){
        sshagent(['a062804f-f225-4cc4-a0b8-5e796153a4a9']) {
        sh 'ls -lrt'
        sh 'pwd'
        sh "scp -o StrictHostKeyChecking=no target/java-deepak-webapp.war ec2-user@13.201.129.195:/opt/tomcat9/webapps"
        sh 'pwd'
        sh 'ls -l target'
        }
    }
    
}
