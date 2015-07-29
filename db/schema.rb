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

ActiveRecord::Schema.define(version: 20150718181203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.integer  "relation_id"
    t.string   "text"
    t.string   "lemmatized"
    t.string   "verb_text"
    t.string   "verb_tense"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.integer  "document_id"
    t.string   "text"
    t.float    "relevance"
    t.string   "knowledge_graph_type_hierarchy"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "documents", force: :cascade do |t|
    t.json     "result"
    t.string   "url"
    t.string   "title"
    t.string   "image"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "documents", ["user_id"], name: "index_documents_on_user_id", using: :btree

  create_table "entities", force: :cascade do |t|
    t.integer  "entityable_id"
    t.string   "entityable_type"
    t.string   "entity_type"
    t.float    "relevance"
    t.string   "knowledge_graph_type_hierarchy"
    t.integer  "count"
    t.string   "text"
    t.string   "disambiguated_name"
    t.string   "disambiguated_geo"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.integer  "keywordable_id"
    t.string   "keywordable_type"
    t.string   "url"
    t.string   "text"
    t.float    "relevance"
    t.string   "knowledge_graph_type_hierarchy"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "relation_objects", force: :cascade do |t|
    t.integer  "relation_id"
    t.string   "text"
    t.float    "relevance"
    t.string   "knowledge_graph_type_hierarchy"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "relations", force: :cascade do |t|
    t.integer  "document_id"
    t.string   "sentence"
    t.string   "subject_text"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sentiments", force: :cascade do |t|
    t.integer  "sentimentable_id"
    t.string   "sentimentable_type"
    t.string   "sentiment_type"
    t.float    "sentiment_score"
    t.integer  "sentiment_mixed"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "documents", "users"
end
