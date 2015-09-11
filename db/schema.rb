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

ActiveRecord::Schema.define(version: 20150911215449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cpostings", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "spots"
    t.string   "title"
    t.string   "picture"
    t.datetime "starts_at"
  end

  add_index "cpostings", ["user_id", "created_at"], name: "index_cpostings_on_user_id_and_created_at", using: :btree
  add_index "cpostings", ["user_id"], name: "index_cpostings_on_user_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "subscriber_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "subscriptions", ["post_id", "subscriber_id"], name: "index_subscriptions_on_post_id_and_subscriber_id", unique: true, using: :btree

  create_table "templates", force: :cascade do |t|
    t.text     "content"
    t.text     "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "templates", ["user_id", "created_at"], name: "index_templates_on_user_id_and_created_at", using: :btree
  add_index "templates", ["user_id"], name: "index_templates_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "company",           default: false, null: false
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_foreign_key "cpostings", "users"
  add_foreign_key "templates", "users"
end
