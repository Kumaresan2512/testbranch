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
                    /* groovylint-disable-next-line UnusedVariable */
                    def workspace = WORKSPACE
                    // ${workspace} will now contain an absolute path to job workspace on slave

                    workspace = env.WORKSPACE
                    // ${workspace} will still contain an absolute path to job workspace on slave

                    // When using a GString at least later Jenkins versions could only handle the env.WORKSPACE variant:
                    echo "Current workspace is ${env.WORKSPACE}"

                    // the current Jenkins instances will support the short syntax, too:
                    echo "Current workspace is $WORKSPACE"
                    conversation_log_files = shellGetOutput("ls ${env.WORKSPACE}")
                    print(conversation_log_files)
                    sh "ls  ${env.WORKSPACE}/languagetool"
                    sh "ls -l ${env.WORKSPACE}/languagetool"

                    //buildDockerImage("testimagename", workspace)
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