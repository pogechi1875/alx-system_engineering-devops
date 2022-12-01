This read me describes the use of puppet as a configuration management tool used to automate proccesses whithin the same nodes from the master node
puppet format
file{ 'file':
content => 'Hello',
group   => 'group',
owner   => 'owner',
}
