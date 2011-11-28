# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111128211400) do

  create_table "assignees", :force => true do |t|
    t.string   "assignee"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignees_contacts", :id => false, :force => true do |t|
    t.integer "assignee_id"
    t.integer "contact_id"
  end

  add_index "assignees_contacts", ["assignee_id", "contact_id"], :name => "index_assignees_contacts_on_assignee_id_and_contact_id"
  add_index "assignees_contacts", ["contact_id", "assignee_id"], :name => "index_assignees_contacts_on_contact_id_and_assignee_id"

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "task"
    t.integer  "assignee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
