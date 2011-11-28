class CreateAssigneesContactsTable < ActiveRecord::Migration
  def self.up
    create_table :assignees_contacts, :id => false do |t|
        t.references :assignee
        t.references :contact
    end
    add_index :assignees_contacts, [:assignee_id, :contact_id]
    add_index :assignees_contacts, [:contact_id, :assignee_id]
  end

  def self.down
    drop_table :assignees_contacts
  end
end
