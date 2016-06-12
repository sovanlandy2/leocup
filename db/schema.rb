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

ActiveRecord::Schema.define(version: 20160612183418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "add_is_current_tournament_to_toursnaments", force: :cascade do |t|
    t.boolean  "is_current_tournament", default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "coach_translations", force: :cascade do |t|
    t.integer  "coach_id",    null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
  end

  add_index "coach_translations", ["coach_id"], name: "index_coach_translations_on_coach_id", using: :btree
  add_index "coach_translations", ["locale"], name: "index_coach_translations_on_locale", using: :btree

  create_table "coaches", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_id"
    t.integer  "age"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "description"
  end

  add_index "coaches", ["name"], name: "index_coaches_on_name", using: :btree
  add_index "coaches", ["team_id"], name: "index_coaches_on_team_id", using: :btree

  create_table "content_blocks", force: :cascade do |t|
    t.integer  "post_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eng_banners", force: :cascade do |t|
    t.text     "tag",                             array: true
    t.integer  "order"
    t.text     "caption"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "gallery_photos", force: :cascade do |t|
    t.integer  "team_left_id"
    t.integer  "team_right_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "gallery_photos", ["team_left_id"], name: "index_gallery_photos_on_team_left_id", using: :btree
  add_index "gallery_photos", ["team_right_id"], name: "index_gallery_photos_on_team_right_id", using: :btree

  create_table "match_translations", force: :cascade do |t|
    t.integer  "match_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "stage"
  end

  add_index "match_translations", ["locale"], name: "index_match_translations_on_locale", using: :btree
  add_index "match_translations", ["match_id"], name: "index_match_translations_on_match_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "team_left_id"
    t.integer  "team_right_id"
    t.datetime "match_date"
    t.text     "score",                                      array: true
    t.string   "stage"
    t.string   "location"
    t.boolean  "visible",       default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "is_completed",  default: false
  end

  add_index "matches", ["team_left_id"], name: "index_matches_on_team_left_id", using: :btree
  add_index "matches", ["team_right_id"], name: "index_matches_on_team_right_id", using: :btree
  add_index "matches", ["tournament_id"], name: "index_matches_on_tournament_id", using: :btree

  create_table "player_translations", force: :cascade do |t|
    t.integer  "player_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "player_translations", ["locale"], name: "index_player_translations_on_locale", using: :btree
  add_index "player_translations", ["player_id"], name: "index_player_translations_on_player_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "team_id"
    t.float    "height"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "players", ["name"], name: "index_players_on_name", using: :btree
  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "pool_translations", force: :cascade do |t|
    t.integer  "pool_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "pool_translations", ["locale"], name: "index_pool_translations_on_locale", using: :btree
  add_index "pool_translations", ["pool_id"], name: "index_pool_translations_on_pool_id", using: :btree

  create_table "pools", force: :cascade do |t|
    t.string   "name"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "pools", ["name"], name: "index_pools_on_name", using: :btree
  add_index "pools", ["tournament_id"], name: "index_pools_on_tournament_id", using: :btree

  create_table "post_photos", force: :cascade do |t|
    t.integer  "post_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "post_photos", ["post_id"], name: "index_post_photos_on_post_id", using: :btree

  create_table "post_translations", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "content"
    t.string   "source"
  end

  add_index "post_translations", ["locale"], name: "index_post_translations_on_locale", using: :btree
  add_index "post_translations", ["post_id"], name: "index_post_translations_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "creation_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "source"
  end

  create_table "region_translations", force: :cascade do |t|
    t.integer  "region_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "region_translations", ["locale"], name: "index_region_translations_on_locale", using: :btree
  add_index "region_translations", ["region_id"], name: "index_region_translations_on_region_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "regions", ["name"], name: "index_regions_on_name", using: :btree

  create_table "slider_photos", force: :cascade do |t|
    t.text     "tag",                             array: true
    t.integer  "order"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "caption"
  end

  create_table "team_pools", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "pool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "team_pools", ["pool_id"], name: "index_team_pools_on_pool_id", using: :btree
  add_index "team_pools", ["team_id"], name: "index_team_pools_on_team_id", using: :btree

  create_table "team_translations", force: :cascade do |t|
    t.integer  "team_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
  end

  add_index "team_translations", ["locale"], name: "index_team_translations_on_locale", using: :btree
  add_index "team_translations", ["team_id"], name: "index_team_translations_on_team_id", using: :btree

  create_table "team_votes", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "team_id"
    t.integer  "facebook_id"
    t.integer  "user_id"
    t.integer  "tournament_id"
  end

  add_index "team_votes", ["facebook_id"], name: "index_team_votes_on_facebook_id", using: :btree
  add_index "team_votes", ["team_id", "facebook_id"], name: "index_team_votes_on_team_id_and_facebook_id", unique: true, using: :btree
  add_index "team_votes", ["team_id"], name: "index_team_votes_on_team_id", using: :btree
  add_index "team_votes", ["tournament_id"], name: "index_team_votes_on_tournament_id", using: :btree
  add_index "team_votes", ["user_id"], name: "index_team_votes_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.text     "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "is_winner",           default: false
  end

  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree
  add_index "teams", ["region_id"], name: "index_teams_on_region_id", using: :btree

  create_table "tournament_translations", force: :cascade do |t|
    t.integer  "tournament_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "location"
  end

  add_index "tournament_translations", ["locale"], name: "index_tournament_translations_on_locale", using: :btree
  add_index "tournament_translations", ["tournament_id"], name: "index_tournament_translations_on_tournament_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.boolean  "visible",               default: true
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "is_current_tournament", default: false
  end

  add_index "tournaments", ["name"], name: "index_tournaments_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["team_id"], name: "index_votes_on_team_id", using: :btree
  add_index "votes", ["user_id", "team_id"], name: "index_votes_on_user_id_and_team_id", unique: true, using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
