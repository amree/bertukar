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

ActiveRecord::Schema.define(:version => 20120210004238) do

  create_table "jobs", :force => true do |t|
    t.integer  "current_job_id"
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "title_id"
    t.integer  "ministry_id"
    t.integer  "gred"
    t.text     "nota"
    t.string   "nama_organisasi"
    t.datetime "expired_at"
    t.datetime "closed_at"
    t.boolean  "is_exchange"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "jobs", ["location_id"], :name => "index_jobs_on_location_id"
  add_index "jobs", ["title_id"], :name => "index_jobs_on_position_id"
  add_index "jobs", ["user_id"], :name => "index_jobs_on_user_id"

  create_table "locations", :force => true do |t|
    t.integer  "state_id"
    t.string   "nama"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ministries", :force => true do |t|
    t.string   "nama"
    t.boolean  "is_aktif",   :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "titles", :force => true do |t|
    t.string   "nama"
    t.string   "skim"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "titles", ["nama"], :name => "index_titles_on_nama", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
