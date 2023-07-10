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
                sh 'echo "Hello world!  asagit"'
                script
                {
                    buildDockerImage("testimagename", ".")
                }
            }
        }
    }
}


def buildDockerImage(image, dockerfilePath) {
    sh """
        chmod +x ./scripts/createDockerImage.sh
        ./scripts/createDockerImage.sh "$image" "$dockerfilePath"
    """
}