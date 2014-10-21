require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string   :todo
      t.date     :created_at
      t.date     :updated_at
      t.integer  :completion_status, default: 0 #1 if completed, 0 if not
      t.date     :completed_at, default: nil

      t.timestamps
    end
  end
end

