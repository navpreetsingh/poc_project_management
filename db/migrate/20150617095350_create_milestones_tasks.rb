class CreateMilestonesTasks < ActiveRecord::Migration
  def change
    create_table :milestones_tasks, id: false do |t|
      t.belongs_to :milestone, index: true
      t.belongs_to :task, index: true
    end
  end
end
