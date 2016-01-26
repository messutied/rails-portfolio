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

ActiveRecord::Schema.define(version: 20151203105347) do

  create_table "portfolio_admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "portfolio_admin_users", ["email"], name: "index_portfolio_admin_users_on_email", unique: true
  add_index "portfolio_admin_users", ["reset_password_token"], name: "index_portfolio_admin_users_on_reset_password_token", unique: true

  create_table "portfolio_site_item_categories", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolio_site_item_images", force: :cascade do |t|
    t.integer  "site_item_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "default",            default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "portfolio_site_item_images", ["site_item_id"], name: "index_portfolio_site_item_images_on_site_item_id"

  create_table "portfolio_site_item_tags", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolio_site_item_tags_items", id: false, force: :cascade do |t|
    t.integer "site_item_id"
    t.integer "site_item_tag_id"
  end

  add_index "portfolio_site_item_tags_items", ["site_item_id"], name: "index_portfolio_site_item_tags_items_on_site_item_id"
  add_index "portfolio_site_item_tags_items", ["site_item_tag_id"], name: "index_portfolio_site_item_tags_items_on_site_item_tag_id"

  create_table "portfolio_site_item_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "portfolio_site_item_types", ["name"], name: "index_portfolio_site_item_types_on_name"

  create_table "portfolio_site_items", force: :cascade do |t|
    t.integer  "site_id",                               null: false
    t.integer  "site_item_type_id",                     null: false
    t.string   "title"
    t.text     "body"
    t.string   "url"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "site_item_category_id"
    t.boolean  "featured",              default: false
    t.boolean  "public",                default: false
  end

  add_index "portfolio_site_items", ["site_id"], name: "index_portfolio_site_items_on_site_id"
  add_index "portfolio_site_items", ["site_item_type_id"], name: "index_portfolio_site_items_on_site_item_type_id"

  create_table "portfolio_site_menu_links", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "portfolio_site_menu_links", ["site_id"], name: "index_portfolio_site_menu_links_on_site_id"

  create_table "portfolio_site_social_links", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "social_link_id"
    t.string   "user_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "portfolio_site_social_links", ["site_id"], name: "index_portfolio_site_social_links_on_site_id"
  add_index "portfolio_site_social_links", ["social_link_id"], name: "index_portfolio_site_social_links_on_social_link_id"

  create_table "portfolio_sites", force: :cascade do |t|
    t.string   "key",                                 null: false
    t.string   "person_name",                         null: false
    t.string   "job_title",                           null: false
    t.string   "greetings"
    t.text     "summary"
    t.string   "email"
    t.boolean  "default",             default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "portfolio_sites", ["key"], name: "index_portfolio_sites_on_key"

  create_table "portfolio_social_links", force: :cascade do |t|
    t.string   "name"
    t.string   "url_pattern"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
