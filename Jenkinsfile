pipeline {
    agent { label "robot" } // run on an agent, which has Robot Framework installed

    stages {
        stage("Run robotidy on repository") {
            steps {
                // --nostatusrc prevents your job from failing automatically if any
                // tests fail. This is then later handled with the RF plugin with
                // pass thresholds
                sh script: "robotidy ./repository/", returnStatus: true
            }
        }
        stage("Run robotidy on automation") {
            steps {
                // --nostatusrc prevents your job from failing automatically if any
                // tests fail. This is then later handled with the RF plugin with
                // pass thresholds
                sh script: "robotidy ./automation/", returnStatus: true
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
                    outputPath          : 'test_results',
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