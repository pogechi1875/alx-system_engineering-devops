#!/usr/bin/env ruby
#Checks phone numbers "Call me"
puts ARGV[0].scan(/^[0-9]{10}$/).join
