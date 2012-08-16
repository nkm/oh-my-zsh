export SQUARE_HOME="$HOME/Development"
export SSH_AUTH_SOCK=$(ls -1t $(find /tmp/* -type s -name 'Listeners' 2>/dev/null) | head -n 1)

alias sq="cd $SQUARE_HOME"

# Easy access to Staging resources
alias ssc="ssh -t stage01 'echo Staging Console; square script/console'"
alias sdb="ssh -t stage01 'echo Staging Database; square script/dbconsole -p'"
alias scs="ssh -t admin01 'echo Staging Cap Shell; square cap staging shell'"
alias sct="ssh -t admin01 'echo Staging Log Tail; square cap staging app:tail'"

# Easy access to Production resources
alias pc="ssh -t dash01 'echo Production Console; square script/console'"
alias pdb="ssh -t dash01 'echo Production Database; square script/dbconsole -p'"
alias pdb2="ssh -t db02 'echo Production Backup Database; sudo -H mysql -uroot'"
alias pcs="ssh -t admin01 'echo Production Cap Shell; square cap production shell'"
alias pct="ssh -t admin01 'echo Production Log Tail; square cap production app:tail'"

# Both the following options make jruby start up *way* faster
# Force java to load in client mode
export JAVA_OPTS="-d32"
# Turn off JIT
export JRUBY_OPTS="-J-Djruby.compile.mode=OFF"

# Add your bin folder to the path, if you have it.  It's a good place to add all your scripts
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi
