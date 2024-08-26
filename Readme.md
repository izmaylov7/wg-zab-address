# Add config-name whis ip-address in zabbix 

## 1 step you need create group `checkers` adn add user `zabbix` in groupe

## 2 spet we add 3 task in `cron` 

### Fisrt task. 
This task copy you name config wg-cli in other folder
```
* */4 * * * root ls /home/`you user` | grep wg0- > /home/log/wgclient.log
```
### Second task 
Copy you config wg-config where user `zabbix` can see `address` 
```
* */12 * * * root cp /home/`you user`/wg0-client-* /usr/share/zabbix/
```
### Third task 
Will issue permissions to read the file
```
* */12 * * * root sudo chown zabbix:zabbix /usr/share/zabbix/wg0-*
```
## 3 step need copy scripst `wgcleint.sh` and `wgaddress.sh` 

## 4 step need create `UserParameter` in `zabbix-agentd.conf`
```
UserParameter=wgclients,/home/scripts/wgclient.sh
UserParameter=pub.key.cli[*],/home/scripts/wgpubkey.sh $1
```