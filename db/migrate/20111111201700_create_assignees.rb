class CreateAssignees < ActiveRecord::Migration
  def change
    create_table :assignees do |t|
      t.string :assignee
      t.text :description

      t.timestamps
    end
  end
end
