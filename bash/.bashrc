SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
   
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# ALIASES
alias f='git fetch'
alias g=git
alias s='git status'
alias ch='git checkout'
alias subl="/c/program\ files\ \(x86\)/Sublime\ Text\ 3/sublime_text.exe"
alias qg='git qg'
alias adda='git adda'
alias clean='git clean -f'
alias push='git push'
alias pull='git pull'
alias locals='git for-each-ref  --format='\''%(refname:short) %(upstream)'\''  refs/heads | awk '\''$2 !~/^refs\/remotes/'\'
alias cge='vim ~/.gitconfig'
__git_complete ch _git_checkout
__git_complete g _git
