#!/usr/bin/env ruby
#-----------------------------------------------
# Name: 
#
# Purpose:
#
# History:
#   Date        Author  Remarks
#-----------------------------------------------

#string interpolation
# a="#{array[1]}"
# quotes
# %q|| = ''
# %Q|| = ""
# %w( fee fi fo) = ["fee","fi","fo"]
# here-doc
# a=<<-END_LIST  (- allows whitespace before terminator)
# 1. do
# 2. this
# 3. now
# END_LIST
#  <<DOUBLE_QUOTE, <<"DOUBLE_QUOTE", <<'SINGLE_QUOTE' rules apply
#string substite
#
# a="Hi There"
# a.gsub("There","Where") => "Hi Where"
# a.gsub!("There","Where") => "Hi Where", modifies a
#
#regexp
# str=~/\s+/
#
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
#
# # example Class with easy initilise
# class Observation 
# #http://stackoverflow.com/questions/982848/dryer-object-initialization-in-ruby
#   FIELDS = %w( aifstime_utc air_temp bom_url apparent_t last_Etag last_polled lat lon name pachube_feed press rain_trace rel_hum wind_dir wind_spd_kmh wmo)
#   SYSTEM = 0
#   DATA = 1
#   attr_accessor *FIELDS
#
#   def initialize( args= { :type => SYSTEM } )
#     args.each_pair do | key, value |
#       self.send("#{key}=", value) if self.respond_to?("#{key}=")
#     end
#   end
#
#   def inspect
#     FIELDS.inject({}) do | hash, field |
#       hash.merge( field.to_sym => self.send(field) )
#     end.inspect
#   end
# end
#
#
