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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150622122910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discussions", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "main_discussion_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "discussions", ["main_discussion_id"], name: "index_discussions_on_main_discussion_id", using: :btree
  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id", using: :btree

  create_table "milestones", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "milestones_tasks", id: false, force: :cascade do |t|
    t.integer "milestone_id"
    t.integer "task_id"
  end

  add_index "milestones_tasks", ["milestone_id"], name: "index_milestones_tasks_on_milestone_id", using: :btree
  add_index "milestones_tasks", ["task_id"], name: "index_milestones_tasks_on_task_id", using: :btree

  create_table "milestones_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "milestone_id"
  end

  add_index "milestones_users", ["milestone_id"], name: "index_milestones_users_on_milestone_id", using: :btree
  add_index "milestones_users", ["user_id"], name: "index_milestones_users_on_user_id", using: :btree

  create_table "project_tasks", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "task_id"
  end

  add_index "project_tasks", ["project_id"], name: "index_project_tasks_on_project_id", using: :btree
  add_index "project_tasks", ["task_id"], name: "index_project_tasks_on_task_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.boolean "member",     default: false
    t.integer "role_id",    default: 2
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id", using: :btree
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree

  create_table "tasks_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
  end

  add_index "tasks_users", ["task_id"], name: "index_tasks_users_on_task_id", using: :btree
  add_index "tasks_users", ["user_id"], name: "index_tasks_users_on_user_id", using: :btree

  create_table "to_do_lists", force: :cascade do |t|
    t.integer  "task_id"
    t.text     "content"
    t.integer  "priority"
    t.integer  "estimated_hours"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "to_do_lists", ["task_id"], name: "index_to_do_lists_on_task_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",      default: "", null: false
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
