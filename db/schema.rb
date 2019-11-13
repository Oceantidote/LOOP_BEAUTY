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

ActiveRecord::Schema.define(version: 2019_11_13_204313) do

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

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "postcode"
    t.string "address_line1"
    t.string "city"
    t.boolean "delivery_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "county"
    t.string "address_line2"
    t.boolean "default_address", default: false
    t.string "phone_number"
    t.boolean "deleted", default: false
    t.boolean "use_as_billing", default: true
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "banners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "basket_products", force: :cascade do |t|
    t.bigint "basket_id"
    t.bigint "product_id"
    t.bigint "shade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.boolean "purchase_with_credit", default: false
    t.index ["basket_id"], name: "index_basket_products_on_basket_id"
    t.index ["product_id"], name: "index_basket_products_on_product_id"
    t.index ["shade_id"], name: "index_basket_products_on_shade_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "discount_code_id"
    t.index ["discount_code_id"], name: "index_baskets_on_discount_code_id"
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
    t.string "sku"
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
    t.string "recommendation"
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
    t.integer "uses", default: 1
    t.integer "user_uses", default: 1
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.string "currency"
    t.string "currency_code"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "freebies", force: :cascade do |t|
    t.bigint "discount_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "display", default: false
    t.string "blurb"
    t.string "heading"
    t.index ["discount_code_id"], name: "index_freebies_on_discount_code_id"
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

  create_table "home_banners", force: :cascade do |t|
    t.string "content"
    t.string "link"
    t.string "link_text"
    t.boolean "display", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text_color"
  end

  create_table "insider_articles", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "by"
    t.string "category"
    t.string "title"
    t.text "text1"
    t.text "text2"
    t.text "text3"
    t.text "text4"
    t.string "cover_alt_text"
    t.string "photo1_alt_text"
    t.string "photo2_alt_text"
    t.string "photo3_alt_text"
    t.boolean "published", default: false
    t.boolean "featured", default: false
    t.boolean "homepage", default: false
    t.string "card_text_color"
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
    t.string "slug"
    t.text "rejection_message"
    t.string "affiliate_code"
    t.text "description"
    t.datetime "publish_date"
    t.integer "visits", default: 0
    t.index ["affiliate_code"], name: "index_lookbooks_on_affiliate_code"
    t.index ["user_id"], name: "index_lookbooks_on_user_id"
  end

  create_table "offer_banners", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "order_id"
    t.bigint "shade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.boolean "purchase_with_credit", default: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
    t.index ["shade_id"], name: "index_order_products_on_shade_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id"
    t.bigint "discount_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_id"
    t.string "affiliate_code"
    t.integer "credit_spent_cents", default: 0
    t.bigint "delivery_address_id"
    t.bigint "billing_address_id"
    t.string "delivery_type"
    t.integer "delivery_cost_cents"
    t.string "affiliation_type"
    t.bigint "affiliation_id"
    t.boolean "processed", default: false
    t.string "sku"
    t.index ["affiliation_type", "affiliation_id"], name: "index_orders_on_affiliation_type_and_affiliation_id"
    t.index ["billing_address_id"], name: "index_orders_on_billing_address_id"
    t.index ["delivery_address_id"], name: "index_orders_on_delivery_address_id"
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
    t.boolean "demoable", default: false
    t.boolean "published", default: false
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
    t.text "question_one"
    t.text "question_two"
    t.text "question_three"
    t.text "question_four"
    t.text "question_five"
    t.text "question_six"
    t.text "answer_one"
    t.text "answer_two"
    t.text "answer_three"
    t.text "answer_four"
    t.text "answer_five"
    t.text "answer_six"
    t.string "photo_one_alt_text"
    t.string "photo_two_alt_text"
    t.string "photo_three_alt_text"
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
    t.integer "number_in_stock", default: 0
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
    t.bigint "category_id"
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
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
    t.string "title"
    t.string "slug"
    t.text "rejection_message"
    t.string "affiliate_code"
    t.string "category"
    t.boolean "featured", default: false
    t.datetime "publish_date"
    t.integer "visits", default: 0
    t.index ["affiliate_code"], name: "index_tutorials_on_affiliate_code"
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
    t.text "description"
    t.boolean "published", default: false
    t.string "stripe_id"
    t.string "referral_code"
    t.string "phone_number"
    t.float "commission_rate", default: 0.0
    t.string "instagram_followers"
    t.string "youtube_subscribers"
    t.string "gender"
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
  add_foreign_key "addresses", "users"
  add_foreign_key "basket_products", "baskets"
  add_foreign_key "basket_products", "products"
  add_foreign_key "basket_products", "shades"
  add_foreign_key "baskets", "discount_codes"
  add_foreign_key "baskets", "users"
  add_foreign_key "customer_reviews", "products"
  add_foreign_key "customer_reviews", "users"
  add_foreign_key "freebies", "discount_codes"
  add_foreign_key "insider_reviews", "products"
  add_foreign_key "insider_reviews", "users"
  add_foreign_key "lookbook_products", "lookbooks"
  add_foreign_key "lookbook_products", "products"
  add_foreign_key "lookbooks", "users"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "order_products", "shades"
  add_foreign_key "orders", "addresses", column: "billing_address_id"
  add_foreign_key "orders", "addresses", column: "delivery_address_id"
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
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "tutorial_products", "products"
  add_foreign_key "tutorial_products", "tutorials"
  add_foreign_key "tutorials", "users"
  add_foreign_key "wishlist_products", "products"
  add_foreign_key "wishlist_products", "shades"
  add_foreign_key "wishlist_products", "wishlists"
  add_foreign_key "wishlists", "users"
end
