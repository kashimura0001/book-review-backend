# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_23_064604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organization_id", null: false
    t.string "isbn", limit: 50
    t.string "title", limit: 255, null: false
    t.string "author", limit: 255, null: false
    t.string "image_url", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
    t.index ["organization_id"], name: "index_books_on_organization_id"
  end

  create_table "organization_invitations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organization_id", null: false
    t.uuid "organization_role_id", null: false
    t.string "invite_code", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.integer "status", null: false
    t.datetime "invited_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invite_code"], name: "index_organization_invitations_on_invite_code", unique: true
    t.index ["organization_id"], name: "index_organization_invitations_on_organization_id"
    t.index ["organization_role_id"], name: "index_organization_invitations_on_organization_role_id"
  end

  create_table "organization_roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "role", limit: 100, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role"], name: "index_organization_roles_on_role", unique: true
  end

  create_table "organization_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organization_id", null: false
    t.uuid "user_id", null: false
    t.uuid "organization_role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_organization_users_on_organization_id"
    t.index ["organization_role_id"], name: "index_organization_users_on_organization_role_id"
    t.index ["user_id"], name: "index_organization_users_on_user_id"
  end

  create_table "organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organization_id", null: false
    t.uuid "user_id", null: false
    t.uuid "book_id", null: false
    t.string "title", limit: 100, null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["organization_id"], name: "index_reviews_on_organization_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "firebase_uid", limit: 255, null: false
    t.string "name", limit: 100, null: false
    t.string "email", limit: 255, null: false
    t.string "avatar_url", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["firebase_uid"], name: "index_users_on_firebase_uid", unique: true
  end

  add_foreign_key "books", "organizations"
  add_foreign_key "organization_invitations", "organization_roles"
  add_foreign_key "organization_invitations", "organizations"
  add_foreign_key "organization_users", "organization_roles"
  add_foreign_key "organization_users", "organizations"
  add_foreign_key "organization_users", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "organizations"
  add_foreign_key "reviews", "users"
end
