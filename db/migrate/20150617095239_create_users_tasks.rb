class CreateUsersTasks < ActiveRecord::Migration
  def change
    create_table :users_tasks, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :task, index: true
    end
  end
end
