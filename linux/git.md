#### setting git

git config --global user.name "Jesus Chinchillas"
git config --global user.email "jesus.chinchillas@megacable.com.mx"
git config --global core.editor nvim
git config --list

#### set git for bitbucket megacable

#### right ~/.ssh folder
drwx------ jchinchillas staff 352 B  Wed Jul  6 12:25:52 2022  .ssh

#### right ~/.ssh files
drwx------ jchinchillas staff 352 B  Wed Jul  6 12:25:52 2022  .
drwxr-xr-x jchinchillas staff 3.2 KB Tue Sep 20 11:45:48 2022  ..
.rw------- jchinchillas staff 576 B  Fri Nov  5 16:59:03 2021  authorized_keys
.rw------- jchinchillas staff 2.6 KB Thu Mar  3 07:47:37 2022  bitbucket_mega_id_rsa
.rw-r--r-- jchinchillas staff 583 B  Thu Mar  3 07:47:37 2022  bitbucket_mega_id_rsa.pub
.rw------- jchinchillas staff 2.6 KB Tue Nov 24 17:20:44 2020  id_rsa
.rw-r--r-- jchinchillas staff 596 B  Tue Nov 24 17:20:44 2020  id_rsa.pub
.rw------- jchinchillas staff  31 KB Wed Jul  6 12:28:56 2022  known_hosts

ssh-keygen ~/.ssh/bitbucket_mega

2847  GIT_SSH_COMMAND="ssh -i ~/.ssh/bitbucket_id_rsa.pub -F /dev/null" git clone git@bitbucket.org:jescarrega/kubernetes.git


2853  GIT_SSH_COMMAND="ssh -i ~/.ssh/bitbucket_rapidus_id_rsa -F /dev/null" git clone git@bitbucket.org:jescarrega/kubernetes.git
2854  GIT_SSH_COMMAND="ssh -i ~/.ssh/bitbucket_rapidus_id_rsa -F /dev/null" git clone git@bitbucket.org:rlabperrones/kubernetes.git

2855  git config core.sshCommand "ssh -i ~/.ssh/bitbucket_rapidus_id_rsa -F /dev/null"
2852  cat bitbucket_rapidus_id_rsa.pub

nvim ~/.ssh/config
