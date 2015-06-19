class CreateProjectsTasks < ActiveRecord::Migration
  def change
    create_table :project_tasks, id: false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :task, index: true
    end    
  end
end
