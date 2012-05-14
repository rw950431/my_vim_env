$ git init .
$ git add .vimrc .vim .bashrc .bash_aliases .irbrc
$ git commit
$ echo create new repo from github web interface
$ echo add ssh public-key
$ git remote add origin git@github.com:rw950431/my_vim_env.git
$ git push -u origin master

$ curl --request POST --user username:passwd https://api.bitbucket.org/1.0/repositories/ --data name=my_vim_env --data scm=git

$ ssh-keygen -f ~/.ssh/bitbucket_rsa
$ vi ~/.ssh/config
Host bitbucket*
   HostName bitbucket.org
   User git
   IdentityFile ~/.ssh/bitbucket_rsa

$ git remote add bitbucket git@bitbucket.org:rw950431/my_vim_env.git
$ git push -u bitbucket master



