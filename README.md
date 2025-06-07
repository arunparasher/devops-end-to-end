# devops-end-to-end

prereqs: aws account, awscli, security creds, kubectl,terraform installed.

1) in terraform folder use- 3VMs-jenkins-master-slave-ansible to deploy 3 ec2 VMs for jenkins and ansible
2) once VMs are created configure ansible on ansible node.
3) in ansible folder, check master ans slave config playbooks for configuring jenkins # incase of Jenkins install failure, add repo to server directly
