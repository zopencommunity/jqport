node('linux') 
{
        stage('Build') {
                build job: 'Port-Pipeline', parameters: [string(name: 'REPO', value: 'zotsampleport'), string(name: 'DESCRIPTION', 'A sample z/OS Open Source project' )]
        }
}
