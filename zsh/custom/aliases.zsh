# tools
alias vi='vim'
alias mysqlstart='mysql.server start'
alias mongostart='mongod run --config /usr/local/Cellar/mongodb/2.0.0-x86_64/mongod.conf'
alias redisstart='redis-server /usr/local/etc/redis.conf'
alias memcachestart='/usr/local/bin/memcached -d'

# Shell commmands
alias x='exit'
alias tf='tail -f'
alias dns='dscacheutil -flushcache'
alias reload='source ~/.zshrc'

# watchr using bundler
alias watchr='_run-with-bundler watchr'
# evergreen with bundler
alias evergreen='_run-with-bundler evergreen'

# watch http requests on the ethernet port on a mac
alias httpdump_wd='sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'
# watch http requests on the airport on a mac
alias httpdump_wl='sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'
