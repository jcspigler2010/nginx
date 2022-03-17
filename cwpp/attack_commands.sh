curl -I http://nginxlb0.cloudmegalodon.us:80/\?id\=%27%20OR%20%271
curl -I http://nginxlb0.cloudmegalodon.us:80/\?id\=\<script\>alert\(\1\)\</script\>
curl -I http://nginxlb0.cloudmegalodon.us:80/\?id\=%3B+%2Fsbin%2Fshutdown
curl -I http://nginxlb0.cloudmegalodon.us:80/\?id\=phpinfo\(\)
curl -I http://nginxlb0.cloudmegalodon.us:80/\?id\=../etc/passwd
curl -I -H 'User-Agent: sqlmap' http://nginxlb0.cloudmegalodon.us:80/
curl -I -H "User-Agent: () { :; }; /bin/eject" http://nginxlb0.cloudmegalodon.us:80/
curl -s -i -X GET -o /dev/null -D - -d '{"test":"test"}' http://nginxlb0.cloudmegalodon.us:80/
curl -H '<header_Name>: <header_value>' http://nginxlb0.cloudmegalodon.us:80/
