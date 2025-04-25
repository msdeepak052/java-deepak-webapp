node{
    
    def mavenHome = tool name: "maven-3.8.5"
    echo "The Job name is: ${env.JOB_NAME}"
    echo "The Node name is: ${env.NODE_NAME}"
    echo "The Build Number is: ${env.BUILD_NUMBER}"
    echo "The Jenkins Home directory is: ${JENKINS_HOME}"
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '3', daysToKeepStr: '', numToKeepStr: '3'))])
   currentBuild.displayName = "dev - ${env.BUILD_NUMBER}"
    
    // Git checkout stage 
    
    stage('CheckoutCode'){
        git branch: 'main', credentialsId: 'Jenkins', url: 'https://github.com/msdeepak052/java-deepak-webapp.git'
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
        sshagent(['cf4fd662-cacd-45fa-ab1b-f4a8716889b1']) {
        sh 'ls -lrt'
        sh 'pwd'
        sh "scp -o StrictHostKeyChecking=no target/java-deepak-webapp.war ubuntu@13.232.172.14:/opt/tomcat9/webapps"
        sh 'pwd'
        sh 'ls -l target'
        }
    }
    
}
