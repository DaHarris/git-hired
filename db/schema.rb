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

ActiveRecord::Schema.define(version: 20150318215650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "field_of_study"
    t.string   "degree"
    t.datetime "degree_date"
    t.string   "school"
  end

  create_table "employments", force: :cascade do |t|
    t.integer "user_id"
    t.string  "company"
    t.string  "title"
    t.boolean "current"
  end

  create_table "projects", force: :cascade do |t|
    t.string  "url"
    t.string  "description"
    t.integer "user_id"
  end

  create_table "repos", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
    t.string  "url"
    t.boolean "show",    default: true
  end

  create_table "skills", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "token"
    t.string   "location"
    t.string   "linkedin_url"
    t.string   "picture_url"
    t.string   "email"
    t.string   "description"
    t.string   "github_id"
    t.integer  "role"
    t.string   "avatar"
    t.string   "looking_for"
    t.string   "twitter_username"
  end

end
