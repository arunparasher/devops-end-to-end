# devops-end-to-end

prereqs: aws account, awscli, security creds, kubectl,terraform installed.

1) in terraform folder use- 3VMs-jenkins-master-slave-ansible to deploy 3 ec2 VMs for jenkins and ansible
2) once VMs are created configure ansible on ansible node.
3) in ansible folder, check master ans slave config playbooks for configuring jenkins # incase of Jenkins install failure, add repo to server directly
4) configure slave in jenkins UI
5) create ttrend multibranch pipeline source scm add SCM creds, username and password/token
6) install multibranch webhook trigger plugin in jenkins, configure in ttrend and github
7) ansible practice files in ansible/29112025 folder, run config_git_ansible.yaml to clone this repo, configure git, install tree and less packages as well.
8) readme updated 11:11 PM