alias d='docker $*'
alias d-c='docker-compose $*'
alias d-killall="docker kill $(docker ps -q)"
alias d-rmall="docker rm $(docker ps -a -q)"
