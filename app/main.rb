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
      t = Task.all
      t.each do |e|
        print "#{e.id}. "
        if e.completion_status == 1
          print "(x)"
        else
          print "( )"
        end
        print e.todo
        puts
      end
    when "add"
      task = @input_command[1..-1].join(" ")
      Task.create(todo: task, created_at: Time.now, updated_at: Time.now)
    when "delete"
      id = @input_command[1]
      Task.where(id: id).destroy_all
    when "complete"
      id = @input_command[1]
      t = Task.find(id)

      t.completion_status = 1
      t.save!


    else
      puts "Wrong Input Option"
    end
  end
end


MainProgram.start