#The puppet code is used to kill a procees called killmenow
exec{ 'pkill':
command => 'pkill -9 -f killmenow',
path    => ['/usr/bin' ,'/usr/sbin' ,'/bin'],
}
