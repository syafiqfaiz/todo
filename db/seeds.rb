require "faker"
require_relative '../app/models/task'

4.times do

  Task.create(todo: Faker::Lorem.sentence, created_at: Time.now,updated_at: Time.now, completion_status: 0,completed_at: nil)
end



