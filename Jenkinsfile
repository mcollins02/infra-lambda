pipeline {
    agent any
    tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform0.11.8"
    }
    parameters {
        string(name: 'CLUSTER_NAME', defaultValue: '', description: 'Name of Customer')
        string(name: 'CUSTOMER_IP', defaultValue: '0.0.0.0/0', description:'IP address for customer access')
        string(name: 'CUSTOMER_DNS', defaultValue: '', description: 'URL to assign the customer TLOS application')
    }
    environment {
        TF_HOME = tool('terraform0.11.8')
        TF_IN_AUTOMATION = "true"
        PATH = "$TF_HOME:$PATH"
    }
    stages {
        stage('ApplicationInit'){
          steps {
                  dir("/var/lib/jenkins/workspace/") {
                    sh "git clone ssh://git@st ${params.CLUSTER_NAME}"
                    sh "cd ${params.CLUSTER_NAME} && terraform init -input=false"

                  }
            }

            }

        stage('ApplicationPlan'){
            steps {
                dir("/var/lib/jenkins/workspace/${params.CLUSTER_NAME}"){
                  sh "terraform plan -var 'CLUSTER_NAME=${params.CLUSTER_NAME}' -var 'CUSTOMER_IP=${params.CUSTOMER_IP}' \
                  -var 'CUSTOMER_DNS=${params.CUSTOMER_DNS}' -out mainn.tfplan;echo \$? > status"
                  stash name: "tlos-application-plan", includes: "main.tfplan"
                }
            }
        }
        stage('ApplicationApply'){
            steps {
                script{
                    def apply = false
                    try {
                        input message: 'confirm apply', ok: 'Apply Config'
                        apply = true
                    } catch (err) {
                        apply = false
                        dir("/var/lib/jenkins/workspace/${params.CLUSTER_NAME}"){
                            sh "terraform destroy -force"
                        }
                         currentBuild.result = 'UNSTABLE'
                    }
                    if(apply){
                        dir("/var/lib/jenkins/workspace/${params.CLUSTER_NAME}"){
                            unstash "tlos-application-plan"
                            sh 'terraform apply tlos-application.tfplan'
                        }
                    }
                }
            }
        }
    }
}
