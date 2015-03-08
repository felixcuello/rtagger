#!/usr/bin/ruby

require 'Rtagger.rb'

#-----------------------------------------------
def main
  directory = ARGV[0] ? ARGV[0] : Dir.pwd
  pattern   = ARGV[1] ? ARGV[1] : pattern_based_on_directory( directory )
  rt_obj    = Rtagger.new
  if rt_obj.do_your_magic( directory, pattern ) then
    puts "Awesome!, your disc has been tagged!"
  else
    puts "Oh No!, Voldemort intercepted my magic :("
  end
end

#-----------------------------------------------
def pattern_based_on_directory( directory )
  if directory =~ /.+\/(.+?)$/ then
    return $1
  end
  raise "The directory seems not to be correct"
end

#-----------------------------------------------
main()
