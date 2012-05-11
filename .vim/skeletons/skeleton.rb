#!/usr/bin/env ruby
#-----------------------------------------------
# Name: 
#
# Purpose:
#
# History:
#   Date        Author  Remarks
#-----------------------------------------------
#
#Iterate over an array
# [1,2,3].each { |i| i=i+1  } => [1,2,3]
# [1,2,3].map { |i| i=i+1 } => [2, 3, 4]
# a=[1,2,3] a.map!{ |i| i=i+1 } => a gets modified to [2, 3, 4]

#Iterate over a hash
#{ 'A' => 'U', 'B' => 'Q' }.each ( |k,v| }
#
#Basic file open
# File.open("data.txt") do |f|
#     f.each_line do |line|
#           # do something here
#     end
# end
# Read all files or stdin
# ARGF.each do |line|
#     puts line if line =~ /login/
# end
#
#Loops
# for i in (1..4)
# end
# items=[1,2]
# for i in items  # aka items.each
# end
# while a<15
#   a=a+1
# end
# case selection
# msg = case rno
#    when 42: "The ultimate result."
#    when 1..10: "Way too small."
#    else "Just wrong"
# end   
#string substite
# a="Hi There"
# a.gsub("There","Where") => "Hi Where"
# a.gsub!("There","Where") => "Hi Where", modifies a
#
#regexp
# str=~/\s+/
#
# Exception
# begin
#    f = open(fn)
#    nlines = 0
#    length = 0
#    f.each { |line| nlines += 1; length += line.length }
# rescue #execute on exception
#       print "File read failed: " + $! + "\n"
# else # execute on normal
#       print fn, ": ", nlines, " lines, ", length, " characters.\n"
# ensure # execute always
#       print "\n"
# end
# Classes
# # Class names must be capitalized.
# class Fred
#   
#   # The initialize method is the constructor.  The @val is
#   # an object value.
#   def initialize(v)
#      @val = v
#   end
#   # Set it and get it.
#   def set(v)
#      @val = v
#   end
#   def get
#      return @val
#   end
# end
