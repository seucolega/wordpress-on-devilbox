# Bashrc folder
#
# 1. This folder will be mounted to /etc/bashrc-devilbox.d
# 2. All files ending by *.sh will be sourced by bash automatically
#    for the devilbox and root user.
#


# Add your custom vimrc and always load it with vim.
# Also make sure you add vimrc to this folder.
#alias vim='vim -u /etc/bashrc-devilbox.d/vimrc

alias www='cd /shared/httpd/my_project/htdocs/wp-content/themes/my_theme'
alias start='www && npm run start'
alias build='www && npm run build'


