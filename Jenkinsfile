pipeline {
    agent { label "robot" } // run on an agent, which has Robot Framework installed

    stages {
        stage("Run Robot tests") {
            steps {
                // --nostatusrc prevents your job from failing automatically if any
                // tests fail. This is then later handled with the RF plugin with
                // pass thresholds
                sh script: "robot test.robot", returnStatus: true
            }
        }
    }
}