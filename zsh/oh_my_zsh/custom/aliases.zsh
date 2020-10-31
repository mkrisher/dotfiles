# services
alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'
alias mongostart='mongod run --config /usr/local/Cellar/mongodb/2.0.0-x86_64/mongod.conf &'
alias redisstart='redis-server /usr/local/etc/redis.conf &'
alias memcachestart='/usr/local/bin/memcached -d'
alias elastic='elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'
alias tmux="TERM=screen-256color-bce tmux"

# shell commmands
alias dnsflush='dscacheutil -flushcache; sudo /usr/bin/killall -HUP mDNSResponder'
alias dnsf="dscacheutil -flushcache; sudo discoveryutil mdnsflushcache"
# watch http requests on the ethernet port on a mac
alias httpdump_wd='sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'
# watch http requests on the airport on a mac
alias httpdump_wl='sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'
alias decrypt='encfs ~/Dropbox/Private/ ~/Private/ -o volname="Dropbox private"'
alias encrypt='umount ~/Dropbox/Private/'
alias scan='nmap -sP 192.168.2.1/24'
alias resource='source ~/.zshrc'

# project utilities
alias code='cd ~/code && clear'
alias dot='cd ~/dotfiles'

alias dp='code && cd datapeloton'

# source local environment aliases
source ~/.aliases
