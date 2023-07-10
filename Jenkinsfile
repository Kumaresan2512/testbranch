//import org.apache.poi.ss.usermodel.WorkbookFactory
/* groovylint-disable LineLength, NestedBlockDepth */
/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    stages
    {
        stage('Build docker image')
        {
            steps
            {
                script
                {
                    print(${env.WORKSPACE})
                    conversation_log_files = shellGetOutput("ls ${env.WORKSPACE}")
                    print(conversation_log_files)   
                    buildDockerImage("testimagename", ${env.WORKSPACE})
                }
            }
        }
    }
}

def shellGetOutput(cmd) {
    return sh(script: cmd, returnStdout: true).trim()
}

def buildDockerImage(image, dockerfilePath) {
    sh """
        chmod +x ./scripts/createDockerImage.sh
        ./scripts/createDockerImage.sh "$image" "$dockerfilePath"
    """
}