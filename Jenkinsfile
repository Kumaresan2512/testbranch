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
                def conversation_log_files = shellGetOutput("ls /languagetool")
                print(conversation_log_files)
                script
                {
                    buildDockerImage("testimagename", "/languagetool")
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