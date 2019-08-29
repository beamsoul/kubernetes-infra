# KOPS WITH TERRAFORM 

Do you guys build Kubernetes from the scratch – yes , used tools Kubeadmin or KOPS 
kops -kubernetes operations – is used to interact with aws on kuberenetes level 
Kubernetes – product of google they have been using it for a long time and they made it publucly available so people can use it, it's open source, that why they a best platform which is GKE - 
and some companies they don't trust google and their company is already build on amazon and they don't want to migrate from AWS to AZURE or GKE  because it's really hard and they gonna hustle.
What they did is- they build a tool called KOPS Kubernetes Operations  - main reason for the KOPS tool is to create a Kubernetes on AWS it doesn't have any other role, KOPS command is used to interact with AWS on Kubernetes level , two ways creating a Kubernetes on AWS it's either done with Kubeadmin command or KOPS command, Kubeadmin doesnt't  give you a lof of options to manage but with the KOPS – is the king of the tools when it comes to AWS, it gives a lot of functionality for you with this two command you can spin up a whole aws cluster for them. 


1) Create a BASTION HOST -  INSTANCE- amazon ec2 role 
2) install terraform 
3) kops 1.14 vers
4) kubectl 1.14 vers
5) awscli

    ssh to bastion host instance and generate pub key 
   $sudo su -
   $ ssh-keygen – leave everything black tap 4 times 

installing terraform on centos7 
$sudo yum update
$sudo yum install wget unzip
$ wget https://releases.hashicorp.com/terraform/0.10.3/terraform_0.10.3_linux_amd64.zip

$sudo unzip ./terraform_0.10.3_linux_amd64.zip -d /usr/local/bin/
$ terraform -v


  
lets install kubectl on linux 
 $ https://kubernetes.io/docs/tasks/tools/install-kubectl/  this is link where you can download the latest version of a kubectl but you have to make sure that kubectl and kops version need to be the same, maybe you don't wanna use the latest version 
 $curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl 
Make the kubectl binary executable.
 $chmod +x ./kubectl
Move the binary in to your PATH.
$ sudo mv ./kubectl /usr/local/bin/kubectl
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
 $chmod +x ./kops
 $ sudo mv ./kops /usr/local/bin/
and next step is go to ROUTE53 and create a hosted zone,

private vpc and choose where you wanna create – making sure that it's privatly available for us 
  we wanna make sure we gonna create a s3 bucket with the same as our hosted domain name 
$aws s3 mb s3://kubernetesbrian.com --region=us-west-2
 
we have to make sure kops command is gonna store configurations when it's creating kubernetes cluster for us, KEEP the detailed information of kops to this bucket  s3://kubernetesbrian.com 
this one is ENV variable KOPS will store everything there 
$export KOPS_STATE_STORE=s3://kubernetesbrian.com 

next step is we have to install autocomlition , the reason that we are putting this we wanna make sure that kops auto-completion works 
yum install bash-completion 
vi .bashrc 
source  <(kops competion bash)
to have more information about the kops we can specify 
$kops create cluster –help  (to get more detailed information to spin a  kops 
$git clone repo
$cd repo name

lets create a KOPS cluster on AWS 
$kops create cluster --name=kubernetesbrian.com     --node-size="m4.large"   --master-size="m4.large"    --master-zones="us-west-2a,us-west-2b,us-west-2c"   --networking="weave"    --topology="private"         --bastion=true  --dns="private"      --zones="us-west-2a,us-west-2b,us-west-2c"    --state="s3://kubernetesbrian.com"      --out=.    --target="terraform"   --yes

make sure the versions are all suitable for each other
$ terraform plan    - #it's gonna show you the plan of things has to be done if it's 89 go ahead and run 
$ terraform apply 

after creating a whole cluster for me 
go to aws and check autoscalling make sure that inservice 3 out 0f 3

TIPS= ~/.kube/config -put this kube hidden file to your home directory and you are ready to ujse this command , you are ready to use kubernetes  to ssh into kops bastion we have copy this file into bastion, we have to migrate this to kops bastion, by default bastion doesn't allow us to ssh from our bastion, and the solution is going to be to change the security group on kops bastion 
and bastion always choose debian ami

$ssh admin@35.161.54.24
$sudo su -
exit 
mkdir .kube
$ and exit from bastion 
$ inside your bastion kubenetes-infra run 
$ which kubectl
$
scp ~/.kube/config  admin@35.161.54.24:/home/admin/.kube #use ssh to copy .kube to
 bastion 
ssh to bastion kops and check the kubefile
$cat ~/.kube/config 

$scp /usr/local/bin/kubectl  admin@35.161.54.24:/home/admin/ -we have to first to home directory and 

$ sudo mv kubectl /bin

$ kubectl get nodes - 

$infra 
$kubernetes-infra]# aws s3 mb s3://kubernetesbrianstate.com --region us-west-2 #moving 3s to state folder


create vi backend.tf 


terraform {


backend "s3" {

bucket = "kubernetesbrianstate.com"

key = "terrastate"

region = "us-east-2"

}

}
The reason making publicly available to everyone
$terraform init 
yes                       # everything is going to be in a backend after on 

mv terraform.tfstate* /tmp/

 mv terraform.tfstate* /tmp/
  131  ls
  132  git add .
  133  git status
  134  ls
  135  git commit -m "added new k8s"
  136  git push -u origin master
  137  history

open our local machine and git clone the repository and paste the repo
 cd repo 


