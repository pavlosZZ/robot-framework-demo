pipeline {
    agent { label "robot" } // run on an agent, which has Robot Framework installed

    stages {
        stage("Run robotidy on repository") {
            steps {
                // run robotidy command to format all robot and resources files.
                sh script: "robotidy .", returnStatus: true
            }
        }
        stage("Run Robot tests") {
            steps {
                // --nostatusrc prevents your job from failing automatically if any
                // tests fail. This is then later handled with the RF plugin with
                // pass thresholds
                sh script: "robot --nostatusrc test.robot", returnStatus: true
            }
        }
    }

    post {
        always {
            step([
                    $class              : 'RobotPublisher',
                    outputPath          : 'results',
                    outputFileName      : "output.xml",
                    reportFileName      : 'report.html',
                    logFileName         : 'log.html',
                    disableArchiveOutput: false,
                    passThreshold       : 95.0,
                    unstableThreshold   : 95.0,
                    otherFiles          : "**/*.png",
            ])
        }
    }
}