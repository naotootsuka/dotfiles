# vim
# export VIMRUNTIME=/usr/local/Cellar/vim/7.4.898/share/vim/vim74 # macbook air
# export VIMRUNTIME=/usr/local/Cellar/vim/7.4.712_1/share/vim/vim74 # iMac

#python
#alias python="/usr/local/bin/python"
#export PATH=/usr/local/share/python:$PATH
#export PATH=/usr/local/bin:$PATH

# Homebrew
# export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

# GAE
# export PATH=/Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine/lib:$PATH
export PYTHONPATH=/Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine/lib:$PYTHONPATH
# export PATH=/Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine:$PATH
export PYTHONPATH=/Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine:$PYTHONPATH

# Django
#export PYTHONPATH=/usr/local/bin:$PYTHONPATH
#export PYTHONPATH=~/dropbox/python関係/django/synonym:PYTHONPATH
#export DJANGO_SETTINGS_MODULE=synonym.settings
# 2016/01/18 一時的に以下をコメント
# export PYTHONPATH=~/dropbox/python関係/django/testproject:$PYTHONPATH
# export PYTHONPATH=~/dropbox/python関係/django/testproject/testproject:$PYTHONPATH
# export DJANGO_SETTINGS_MODULE=testproject.settings

#pip
export PYTHONIOENCODING=utf-8

#script
export PATH=~/dropbox/script:$PATH

# lilypond
export PATH=/usr/texbin:$PATH

# aliasの設定
#alias python="/usr/bin/python"
alias pk="cd ~/dropbox/python関係"
alias tp="cd ~/dropbox/python関係/django/testproject"
alias mtp="python ~/dropbox/python関係/django/testproject/manage.py runserver --insecure"
alias mem="memcached -u memcached -d -m 1024 -l 127.0.0.1 -I 5m"
alias gae="cd ~/dropbox/'google app engine'"
alias ls="ls -aG"
alias youtube_tag="cd ~/dropbox/python関係/youtube_tag"
alias t='~/Dropbox/Script/createTabAtCurrentDirectory.applescript'
alias cb='python /Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine/dev_appserver.py --high_replication "/Users/naotootsuka/dropbox/google app engine/coursebuildernlabtest"'
#alias revue="python ~/dropbox/python関係/idolword/fetchnewrevue.py"
alias bcp="~/dropbox/script/backup_copy.sh"

# テスト
export PATH=~/dropbox/python関係/algorithm/new:$PATH
