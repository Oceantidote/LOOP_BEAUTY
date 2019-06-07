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

ActiveRecord::Schema.define(version: 2019_06_07_102202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "basket_products", force: :cascade do |t|
    t.bigint "basket_id"
    t.bigint "product_id"
    t.bigint "shade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.index ["basket_id"], name: "index_basket_products_on_basket_id"
    t.index ["product_id"], name: "index_basket_products_on_product_id"
    t.index ["shade_id"], name: "index_basket_products_on_shade_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "benefits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "logo"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_brands_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "rating"
    t.bigint "product_id"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_customer_reviews_on_product_id"
    t.index ["user_id"], name: "index_customer_reviews_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discount_codes", force: :cascade do |t|
    t.string "code"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "insider_articles", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_insider_articles_on_user_id"
  end

  create_table "insider_reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "rating"
    t.bigint "product_id"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_insider_reviews_on_product_id"
    t.index ["user_id"], name: "index_insider_reviews_on_user_id"
  end

  create_table "lookbook_products", force: :cascade do |t|
    t.bigint "lookbook_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lookbook_id"], name: "index_lookbook_products_on_lookbook_id"
    t.index ["product_id"], name: "index_lookbook_products_on_product_id"
  end

  create_table "lookbooks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "affiliate_link"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["user_id"], name: "index_lookbooks_on_user_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "order_id"
    t.bigint "shade_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
    t.index ["shade_id"], name: "index_order_products_on_shade_id"
    t.index ["user_id"], name: "index_order_products_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id"
    t.bigint "discount_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_code_id"], name: "index_orders_on_discount_code_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_benefits", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "benefit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_product_benefits_on_benefit_id"
    t.index ["product_id"], name: "index_product_benefits_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.float "weight"
    t.string "measurement"
    t.string "title"
    t.text "details"
    t.string "lb_id"
    t.bigint "category_id"
    t.bigint "sub_category_id"
    t.bigint "brand_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "slug"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["department_id"], name: "index_products_on_department_id"
    t.index ["slug"], name: "index_products_on_slug", unique: true
    t.index ["sub_category_id"], name: "index_products_on_sub_category_id"
  end

  create_table "question_answers", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_question_answers_on_user_id"
  end

  create_table "recommended_products", force: :cascade do |t|
    t.bigint "recommender_id"
    t.bigint "recommended_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recommended_id"], name: "index_recommended_products_on_recommended_id"
    t.index ["recommender_id"], name: "index_recommended_products_on_recommender_id"
  end

  create_table "shades", force: :cascade do |t|
    t.bigint "product_id"
    t.string "sku"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shades_on_product_id"
  end

  create_table "showroom_products", force: :cascade do |t|
    t.bigint "showroom_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_showroom_products_on_product_id"
    t.index ["showroom_id"], name: "index_showroom_products_on_showroom_id"
  end

  create_table "showrooms", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_showrooms_on_user_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutorial_products", force: :cascade do |t|
    t.bigint "tutorial_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_tutorial_products_on_product_id"
    t.index ["tutorial_id"], name: "index_tutorial_products_on_tutorial_id"
  end

  create_table "tutorials", force: :cascade do |t|
    t.bigint "user_id"
    t.string "affiliate_link"
    t.string "video"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tutorials_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.string "origin"
    t.string "instagram"
    t.string "twitter"
    t.string "youtube"
    t.boolean "newsletter", default: false
    t.boolean "accepts_terms", default: false
    t.boolean "influencer", default: false
    t.date "dob"
    t.string "slug"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  create_table "wishlist_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "shade_id"
    t.bigint "wishlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_wishlist_products_on_product_id"
    t.index ["shade_id"], name: "index_wishlist_products_on_shade_id"
    t.index ["wishlist_id"], name: "index_wishlist_products_on_wishlist_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "basket_products", "baskets"
  add_foreign_key "basket_products", "products"
  add_foreign_key "basket_products", "shades"
  add_foreign_key "baskets", "users"
  add_foreign_key "customer_reviews", "products"
  add_foreign_key "customer_reviews", "users"
  add_foreign_key "insider_articles", "users"
  add_foreign_key "insider_reviews", "products"
  add_foreign_key "insider_reviews", "users"
  add_foreign_key "lookbook_products", "lookbooks"
  add_foreign_key "lookbook_products", "products"
  add_foreign_key "lookbooks", "users"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "order_products", "shades"
  add_foreign_key "order_products", "users"
  add_foreign_key "orders", "discount_codes"
  add_foreign_key "orders", "users"
  add_foreign_key "product_benefits", "benefits"
  add_foreign_key "product_benefits", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "departments"
  add_foreign_key "products", "sub_categories"
  add_foreign_key "question_answers", "users"
  add_foreign_key "recommended_products", "products", column: "recommended_id"
  add_foreign_key "recommended_products", "products", column: "recommender_id"
  add_foreign_key "shades", "products"
  add_foreign_key "showroom_products", "products"
  add_foreign_key "showroom_products", "showrooms"
  add_foreign_key "showrooms", "users"
  add_foreign_key "tutorial_products", "products"
  add_foreign_key "tutorial_products", "tutorials"
  add_foreign_key "tutorials", "users"
  add_foreign_key "wishlist_products", "products"
  add_foreign_key "wishlist_products", "shades"
  add_foreign_key "wishlist_products", "wishlists"
  add_foreign_key "wishlists", "users"
end
