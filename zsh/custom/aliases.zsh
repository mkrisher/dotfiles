# tools
alias vi='vim'
alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'
alias mongostart='mongod run --config /usr/local/Cellar/mongodb/2.0.0-x86_64/mongod.conf &'
alias redisstart='redis-server /usr/local/etc/redis.conf &'
alias memcachestart='/usr/local/bin/memcached -d'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Shell commmands
alias x='exit'
alias dns='dscacheutil -flushcache'
alias reload='source ~/.zshrc'
alias ip='ifconfig |grep inet'

# watchr using bundler
alias watchr='bundle exec watchr ~/watchr.rb'

# watch http requests on the ethernet port on a mac
alias httpdump_wd='sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'
# watch http requests on the airport on a mac
alias httpdump_wl='sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'

# vagrant aliases
alias vagrant='NOEXEC=0 vagrant'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias vssh='vagrant ssh && cd conduit'

#tailing log
alias devlog='tail -f log/development.log'
alias testlog='tail -f log/test.log'

# run tmux in 256 mode
alias tmux="TERM=screen-256color-bce tmux"
