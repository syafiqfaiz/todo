require 'active_record'
require_relative '../db/config'
require_relative '../app/models/task'



class MainProgram
  def self.start
    @input_command = ARGV
    do_option
  end

  def self.do_option
    case @input_command[0]
    when "list"
     Task.list!
    when "add"
      Task.add!(@input_command[1..-1].join(" "))
    when "delete"
      Task.delete!(@input_command[1])
    when "complete"
      Task.completed!(@input_command[1])
    else
      puts "Wrong Input Option"
    end
  end
end


MainProgram.start