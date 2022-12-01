#This Puppet code is used to install flask of the specified version

package{ 'flask':
ensure   => '2.1.0',
provider => 'pip3',
}
