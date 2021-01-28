set fish_greeting ''

set PATH ./node_modules/.bin $PATH
set PATH ./vendor/bin $PATH
set PATH ~/.config/composer/vendor/bin $PATH

alias du="UID_GID=(id -u):(id -g) docker-compose -f ~/code/talently/docker-compose.yml up -d"
alias ds="docker-compose -f ~/code/talently/docker-compose.yml stop"
