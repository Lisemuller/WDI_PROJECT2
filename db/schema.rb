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

ActiveRecord::Schema.define(version: 20160222162817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "files", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.string "description"
    t.string "image"
  end

  create_table "folders", force: :cascade do |t|
    t.string "title"
    t.string "image"
  end

  create_table "folders_users", id: false, force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "folder_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "folder_id"
    t.string  "username"
    t.string  "email"
    t.string  "password_digest"
    t.string  "image"
  end

  create_table "users_friends", id: false, force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "friend_id", null: false
  end

end