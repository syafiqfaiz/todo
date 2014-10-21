class Task < ActiveRecord::Base

  def self.completed!(id)
    t = Task.find(id)
    t.completion_status = 1
    t.updated_at = Time.now
    t.save!
  end

  def self.delete!(id)
    Task.where(id: id).destroy_all
  end

  def self.add!(task)
    Task.create(todo: task, created_at: Time.now, updated_at: Time.now)
  end

  def self.list!
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
  end

end
