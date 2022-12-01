#The puppet code creates the file school and assigns it to an owner and group

file{ '/tmp/school':
content => 'I love puppet',
owner   => 'www-data',
group   => 'www-data',
mode    => '0744',
}
