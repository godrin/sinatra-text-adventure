#!/usr/bin/env ruby
require 'pp'

class Room
  attr_accessor :title,:name,:lines
  def initialize(name)
    @name=name
    @lines=[]
  end
  def linesp
    @lines.join("").gsub(/\[\[([^|]+)\|([^\]]+)\]\]/,'<a href="/\1">\2</a>')
  end
end
rooms=[]
room=nil
File.open("rooms.txt").read.each_line{|line|
 case line
 when /^:.*/
   rooms<<room if room
   room=Room.new(line[1..-1].strip)
 when /^=.*/
   room.title=line[1..-1].strip
 when /^.+$/
   room.lines<<line
 end
}
rooms<<room if room
$rooms=rooms
