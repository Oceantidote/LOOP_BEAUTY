# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
HomeBanner.destroy_all
OfferBanner.destroy_all
DiscountCode.destroy_all
Freebie.destroy_all
ShowroomProduct.destroy_all
Showroom.destroy_all
CustomerReview.destroy_all
InsiderReview.destroy_all
InsiderArticle.destroy_all
Department.destroy_all
Brand.destroy_all
Category.destroy_all
SubCategory.destroy_all
Shade.destroy_all
ProductBenefit.destroy_all
Benefit.destroy_all
RecommendedProduct.destroy_all
TutorialProduct.destroy_all
Product.destroy_all
Tutorial.destroy_all
QuestionAnswer.destroy_all
User.destroy_all

# CREATING HOME BANNERS
puts ""
puts ""
puts "CREATING HOME BANNERS"

hb1 = HomeBanner.new( content: "Introducing Glossier’s new eye pallette..", link: "/insider_articles", link_text: "See more articles", display: true )

hb1_banner = File.join(Rails.root,'app/assets/images/homepage-header.jpg')
hb1.banner.attach(io: File.open(hb1_banner), filename: 'homepage-header.jpg')

hb1.save

hb2 = HomeBanner.new( content: "Shop the new look here..", link: "/products", link_text: "Shop now", display: true )

hb2_banner = File.join(Rails.root,'app/assets/images/home-banner2.jpg')
hb2.banner.attach(io: File.open(hb2_banner), filename: 'home-banner2.jpg')

hb2.save

hb3 = HomeBanner.new( content: "Get the look from your favourite influencers..", link: "/influencers", link_text: "See all influencers", display: true )

hb3_banner = File.join(Rails.root,'app/assets/images/home-banner3.jpg')
hb3.banner.attach(io: File.open(hb3_banner), filename: 'home-banner3.jpg')

hb3.save

hb4 = HomeBanner.new( content: "Watch Shantania's latest tutorial..", link: "/tutorials/everyday-drugstore-5-makeup-tutorial", link_text: "Watch tutorial here", display: false )

hb4_banner = File.join(Rails.root,'app/assets/images/shantania_cover.jpg')
hb4.banner.attach(io: File.open(hb4_banner), filename: 'shantania_cover.jpg')

hb4.save

puts "-"

# CREATING OFFER BANNER

puts "CREATING OFFER BANNERS"

OfferBanner.create!(content: "FREE SAMPLES WITH EVERY ORDER")

puts "-"

# CREATING DISCOUNT CODE

puts "CREATING DISCOUNT CODE"

code = DiscountCode.create!(code: 'WELCOME2LOOP', discount: 10, uses: 10000000 , user_uses: 1)

puts "-"

puts "*****************************"
puts "DISCOUNT CODE: WELCOME2LOOP"
puts "*****************************"

puts "-"

# CREATING FREEBIE

puts "CREATING FREEBIE"

freebie = Freebie.new(heading: 'First time with us?', blurb: 'Get 10% off your first order', display: true, discount_code: code)

freebie_banner = File.join(Rails.root,'app/assets/images/freebie-banner.jpg')
freebie.banner.attach(io: File.open(freebie_banner), filename: 'freebie-banner.jpg')

freebie.save

puts "-"

# CREATING DEPARTMENTS

puts "CREATING DEPARTMENT"


makeup = Department.create!(name: "Makeup")

puts "-"

# CREATING BRANDS

puts "CREATING BRANDS"

black_opal = Brand.create!(name: "Black Opal", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")
juvias_place = Brand.create!(name: "Juvia's Place", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")
beauty_edit_mayfair = Brand.create!(name: "Beauty Edit Mayfair", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")
makeup_54 = Brand.create!(name: "Makeup 54", description: "MAKEUP54 embodies the glittering glamour of the seventies and eighties decades. Paying tribute to the iconic figures who seized the style of the era, MAKEUP54 celebrates idols who reflect the age and the decadence of discotheques they danced in. MAKEUP54 captures the escapism of its eras, campaigns for colour and is makeup styled to BE SEEN in.")
sacha_cosmetics = Brand.create!(name: "Sacha Cosmetics", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")
black_up = Brand.create!(name: "Black Up", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")
mdm_flow = Brand.create!(name: "MDM Flow", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")

mp = File.join(Rails.root,'app/assets/images/makeup_54_logo.jpg')
makeup_54.logo.attach(io: File.open(mp) , filename: 'makeup_54_logo.jpg')
mp2 = File.join(Rails.root,'app/assets/images/makeup_54_photo.jpg')
makeup_54.photo.attach(io: File.open(mp2) , filename: 'makeup_54_photo.jpg')

bp = File.join(Rails.root,'app/assets/images/beauty_edit_mayfair_logo.jpg')
beauty_edit_mayfair.logo.attach(io: File.open(bp), filename: 'beauty_edit_mayfair_logo.jpg')
bp2 = File.join(Rails.root,'app/assets/images/beauty_edit_mayfair_photo.jpg')
beauty_edit_mayfair.photo.attach(io: File.open(bp2), filename: 'beauty_edit_mayfair_photo.jpg')

puts "-"

# CREATING CATEGORIES

puts "CREATING CATEGORIES"

face = Category.create!(name: "Face")
tools = Category.create!(name: "Tools")
lips = Category.create!(name: "Lips")
eyes = Category.create!(name: "Eyes")
gifts_sets = Category.create!(name: "Gift Sets")

puts "-"

# CREATING SUB_CATEGORIES

puts "CREATING SUB CATEGORIES"

blush = SubCategory.create!(name: "Blush")
powder = SubCategory.create!(name: "Powder")
highlighter = SubCategory.create!(name: "Highlighter")
foundation = SubCategory.create!(name: "Foundation")
concealer = SubCategory.create!(name: "Concealer")
primer = SubCategory.create!(name: "Primer")
lipstick = SubCategory.create!(name: "Lipstick")
lip_gloss = SubCategory.create!(name: "Lip Gloss")
lip_liner = SubCategory.create!(name: "Lip Liner")
eyeshadow = SubCategory.create!(name: "Eyeshadow")
eyeliner = SubCategory.create!(name: "Eyeliner")
brow = SubCategory.create!(name: "Brow")
mascara = SubCategory.create!(name: "Mascara")
sub_tools = SubCategory.create!(name: "Tools")
sub_gift_sets = SubCategory.create!(name: "Gift Sets")

puts "-"

# CREATING BENEFITS

puts "CREATING BENEFITS"

vegan = Benefit.create!(name: "Vegan")
cruelty_free = Benefit.create!(name: "Cruelty Free")
paraben_free = Benefit.create!(name: "Paraben Free")
lanolin_free = Benefit.create!(name: "Lanolin Free")
fragrance_free = Benefit.create!(name: "Fragrance Free")
mineral_oil_free = Benefit.create!(name: "Mineral Oil Free")
derma_tested = Benefit.create!(name: "Dermatologist Tested")
waterproof = Benefit.create!(name: "Waterproof")
longwearing = Benefit.create!(name: "Longwearing")
buildable_coverage = Benefit.create!(name: "Buildable Coverage")
transfer_resistant = Benefit.create!(name: "Transfer Resistant")
creamy_fluid_formula = Benefit.create!(name: "Creamy Fluid Formula")
non_drying = Benefit.create!(name: "Non Drying")

puts "-"

# CREATING PRODUCTS FOR MAKEUP 54

puts "CREATING PRODUCTS"

# DISCO FLUID LIPSTICK
disco_fluid_lipstick = Product.create!(
    measurement: "grams",
    title: "Disco Fluid Lipstick",
    lb_id: "LB00001",
    department: makeup,
    category: lips,
    sub_category: lipstick,
    brand: makeup_54,
    weight: 53,
    price_cents: 1700,
    details: "Take your lips to the dancefloor for velvet smooth, kissable lips that will last all night long. This unique texture changes continuously, creamy and enveloping in application, it transforms itself from velvety to absolute matte for impeccable perfection. A special mix of emollient oils give a creamy texture and smooth finish, with a silky touch. Optimal hold and no transfer for impeccable colour that lasts over time.",
    published: true
  )

red_jerry = Shade.create!(name: "Red - Jerry", sku: "M5400001", product: disco_fluid_lipstick)
pink_ross = Shade.create!(name: "Pink - Ross", sku: "M5400002", product: disco_fluid_lipstick)
nude_gaynor = Shade.create!(name: "Nude - Gaynor", sku: "M5400004", product: disco_fluid_lipstick)

rj1 = File.join(Rails.root,'app/assets/images/red_jerry1.jpg')
red_jerry.photos.attach(io: File.open(rj1) , filename: 'red_jerry1.jpg')

rj2 = File.join(Rails.root,'app/assets/images/red_jerry2.jpg')
red_jerry.photos.attach(io: File.open(rj2) , filename: 'red_jerry2.jpg')

rj3 = File.join(Rails.root,'app/assets/images/red_jerry3.jpg')
red_jerry.photos.attach(io: File.open(rj3) , filename: 'red_jerry3.jpg')

rj4 = File.join(Rails.root,'app/assets/images/red_jerry4.jpg')
red_jerry.photos.attach(io: File.open(rj4) , filename: 'red_jerry4.jpg')

rj5 = File.join(Rails.root,'app/assets/images/red_jerry5.jpg')
red_jerry.photos.attach(io: File.open(rj5) , filename: 'red_jerry5.jpg')

pink_ross1 = File.join(Rails.root,'app/assets/images/pink_ross1.jpg')
pink_ross.photos.attach(io: File.open(pink_ross1) , filename: 'pink_ross1.jpg')

pink_ross2 = File.join(Rails.root,'app/assets/images/pink_ross2.jpg')
pink_ross.photos.attach(io: File.open(pink_ross2) , filename: 'pink_ross2.jpg')

pink_ross3 = File.join(Rails.root,'app/assets/images/pink_ross3.jpg')
pink_ross.photos.attach(io: File.open(pink_ross3) , filename: 'pink_ross3.jpg')

pink_ross4 = File.join(Rails.root,'app/assets/images/pink_ross4.jpg')
pink_ross.photos.attach(io: File.open(pink_ross4) , filename: 'pink_ross4.jpg')

pink_ross5 = File.join(Rails.root,'app/assets/images/pink_ross5.jpg')
pink_ross.photos.attach(io: File.open(pink_ross5) , filename: 'pink_ross5.jpg')

nude_gaynor1 = File.join(Rails.root,'app/assets/images/nude_gaynor1.jpg')
nude_gaynor.photos.attach(io: File.open(nude_gaynor1) , filename: 'nude_gaynor1.jpg')

nude_gaynor2 = File.join(Rails.root,'app/assets/images/nude_gaynor2.jpg')
nude_gaynor.photos.attach(io: File.open(nude_gaynor2) , filename: 'nude_gaynor2.jpg')

nude_gaynor3 = File.join(Rails.root,'app/assets/images/nude_gaynor3.jpg')
nude_gaynor.photos.attach(io: File.open(nude_gaynor3) , filename: 'nude_gaynor3.jpg')

nude_gaynor4 = File.join(Rails.root,'app/assets/images/nude_gaynor4.jpg')
nude_gaynor.photos.attach(io: File.open(nude_gaynor4) , filename: 'nude_gaynor4.jpg')

nude_gaynor5 = File.join(Rails.root,'app/assets/images/nude_gaynor5.jpg')
nude_gaynor.photos.attach(io: File.open(nude_gaynor5) , filename: 'nude_gaynor5.jpg')

v_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: vegan)
long_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: longwearing)
build_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: buildable_coverage)
transfer_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: transfer_resistant)
creamy_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: creamy_fluid_formula)
non_dry_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: non_drying)

# DISCO TOPPER

disco_topper_lip_topper = Product.create!(
  measurement: "grams",
  title: "Disco Topper Lip Topper",
  lb_id: "LB0002",
  department: makeup,
  category: lips,
  sub_category: lipstick,
  brand: makeup_54,
  weight: 53,
  price_cents: 1800,
  details: "The only accessory to be seen with on the dancefloor. Transform your lips before you hit the dancefloor and see the stars from the sky light up your lips with one swipe of this dazzling glitter topcoat. A special water infused gel texture, with moonstone extract gives a multidimensional, glittered effect when applied on lips. Once set it gives a long, locked in finish. Use with your favourite Makeup54 disco lipstick for the ultimate lip colour that is sure to get you seen.",
  published: true
  )

glitterball = Shade.create!(name: "Glitterball", sku: "M5400005", product: disco_topper_lip_topper)

glitterball1 = File.join(Rails.root,'app/assets/images/glitterball1.jpg')
glitterball.photos.attach(io: File.open(glitterball1) , filename: 'glitterball1.jpg')

glitterball2 = File.join(Rails.root,'app/assets/images/glitterball2.jpg')
glitterball.photos.attach(io: File.open(glitterball2) , filename: 'glitterball2.jpg')

glitterball3 = File.join(Rails.root,'app/assets/images/glitterball3.jpg')
glitterball.photos.attach(io: File.open(glitterball3) , filename: 'glitterball3.jpg')

glitterball4 = File.join(Rails.root,'app/assets/images/glitterball4.jpg')
glitterball.photos.attach(io: File.open(glitterball4) , filename: 'glitterball4.jpg')


v_disco_topper = ProductBenefit.create!(product: disco_topper_lip_topper, benefit: vegan)
long_disco_topper = ProductBenefit.create!(product: disco_topper_lip_topper, benefit: longwearing)
build_disco_topper = ProductBenefit.create!(product: disco_topper_lip_topper, benefit: buildable_coverage)
transfer_disco_topper = ProductBenefit.create!(product: disco_topper_lip_topper, benefit: transfer_resistant)
creamy_disco_topper = ProductBenefit.create!(product: disco_topper_lip_topper, benefit: creamy_fluid_formula)
non_dry_disco_topper = ProductBenefit.create!(product: disco_topper_lip_topper, benefit: non_drying)

# RECOMMENDED JOINS

disco_fluid_recom = RecommendedProduct.create!(recommender: disco_fluid_lipstick, recommended: disco_topper_lip_topper)
disco_top_recom = RecommendedProduct.create!(recommender: disco_topper_lip_topper, recommended: disco_fluid_lipstick)


# CREATING PRODUCTS FOR BEAUTY EDIT MAYFAIR

# BROW LIFT

brow_lift = Product.create!(
  title: "Brow Lift",
  lb_id: "LB00003",
  measurement: "grams",
  department: makeup,
  demoable: true,
  category: eyes,
  sub_category: brow,
  brand: beauty_edit_mayfair,
  weight: 1.41,
  price_cents: 2400,
  details: "Achieve an instant eye lift. This lightweight, silky highlighter defines brows with a matte finish to raise and accentuate the brow bone. Its creamy formula means it is applied easily to achieve a softly defined finish. This pencil, formulated with dry emollients, is also an effective concealer, disguising eyebrow tattoos or imperfections.",
  published: true
)

pick_me_up = Shade.create!(name: "Pick-Me-Up", sku: "BL03", product: brow_lift)

pick_me_up1 = File.join(Rails.root,'app/assets/images/pick_me_up1.png')
pick_me_up.photos.attach(io: File.open(pick_me_up1) , filename: 'pick_me_up1.png')

pick_me_up2 = File.join(Rails.root,'app/assets/images/pick_me_up2.jpg')
pick_me_up.photos.attach(io: File.open(pick_me_up2) , filename: 'pick_me_up2.jpg')

pick_me_up3 = File.join(Rails.root,'app/assets/images/pick_me_up3.jpg')
pick_me_up.photos.attach(io: File.open(pick_me_up3) , filename: 'pick_me_up3.jpg')

v_brow_lift = ProductBenefit.create!(product: brow_lift, benefit: vegan)
cruelty_brow_lift = ProductBenefit.create!(product: brow_lift, benefit: cruelty_free)
paraben_brow_lift = ProductBenefit.create!(product: brow_lift, benefit: paraben_free)
lanolin_brow_lift = ProductBenefit.create!(product: brow_lift, benefit: lanolin_free)
fragrance_brow_lift = ProductBenefit.create!(product: brow_lift, benefit: fragrance_free)
mineral_brow_lift = ProductBenefit.create!(product: brow_lift, benefit: mineral_oil_free)
derma_brow_lift = ProductBenefit.create!(product: brow_lift, benefit: derma_tested)


# BROW FILLER

brow_filler = Product.create!(
  title: "Brow Filler",
  lb_id: "LB00004",
  measurement: "grams",
  department: makeup,
  category: eyes,
  sub_category: brow,
  brand: beauty_edit_mayfair,
  weight: 1.41,
  price_cents: 2000,
  details: "Essential for brow beauty. This creates beautifully defined brows with a non-waxy finish. The intensely pigmented lead delivers a precise line and perfectly mimics brow hairs. It lasts up to 12 hours.",
  published: true
  )

dark_dahlia = Shade.create!(name: "Dark Dahlia", sku: "BF03", product: brow_filler)

dark_dahlia1 = File.join(Rails.root,'app/assets/images/dark_dahlia1.png')
dark_dahlia.photos.attach(io: File.open(dark_dahlia1) , filename: 'dark_dahlia1.png')

dark_dahlia2 = File.join(Rails.root,'app/assets/images/dark_dahlia2.jpg')
dark_dahlia.photos.attach(io: File.open(dark_dahlia2) , filename: 'dark_dahlia2.jpg')

dark_dahlia3 = File.join(Rails.root,'app/assets/images/dark_dahlia3.jpg')
dark_dahlia.photos.attach(io: File.open(dark_dahlia3) , filename: 'dark_dahlia3.jpg')

v_brow_filler = ProductBenefit.create!(product: brow_filler, benefit: vegan)
cruelty_brow_filler = ProductBenefit.create!(product: brow_filler, benefit: cruelty_free)
waterproof_brow_filler = ProductBenefit.create!(product: brow_filler, benefit: waterproof)
fragrance_brow_filler = ProductBenefit.create!(product: brow_filler, benefit: fragrance_free)
mineral_brow_filler = ProductBenefit.create!(product: brow_filler, benefit: mineral_oil_free)
derma_brow_filler = ProductBenefit.create!(product: brow_filler, benefit: derma_tested)


# BROW SETTER

brow_setter = Product.create!(
  title: "Brow Setter",
  lb_id: "LB00005",
  measurement: "ml",
  department: makeup,
  category: eyes,
  sub_category: brow,
  brand: beauty_edit_mayfair,
  weight: 8.8,
  demoable: true,
  price_cents: 2500,
  details: "Sets, defines and holds. A clear brow gel that sets and holds brows and can be worn alone or with an eyebrow pencil. There is no product build-up, and the gel contains vitamins B5 and E as well as castor oil to strengthen and condition hair brows.",
  published: true
)

clear = Shade.create!(name: "Clear", sku: "BR01", product: brow_setter)

clear1 = File.join(Rails.root,'app/assets/images/clear1.png')
clear.photos.attach(io: File.open(clear1) , filename: 'clear1.png')

clear2 = File.join(Rails.root,'app/assets/images/clear2.jpg')
clear.photos.attach(io: File.open(clear2) , filename: 'clear2.jpg')

v_brow_setter = ProductBenefit.create!(product: brow_setter, benefit: vegan)
cruelty_brow_setter = ProductBenefit.create!(product: brow_setter, benefit: cruelty_free)
fragrance_brow_setter = ProductBenefit.create!(product: brow_setter, benefit: fragrance_free)
mineral_brow_setter = ProductBenefit.create!(product: brow_setter, benefit: mineral_oil_free)
derma_brow_setter = ProductBenefit.create!(product: brow_setter, benefit: derma_tested)


# BROW styler

brow_styler = Product.create!(
  title: "Brow Styler",
  lb_id: "LB00006",
  measurement: "",
  department: makeup,
  category: tools,
  sub_category: sub_tools,
  brand: beauty_edit_mayfair,
  price_cents: 1800,
  details: "A multi-tasking brow brush. This nifty-sized spoolie brush is the perfect brow styling tool which also tames the brows while distributing brow pencil evenly to achieve a natural look.",
  published: true
)

brush = Shade.create!(name: "", sku: "BS01", product: brow_styler)

brush1 = File.join(Rails.root,'app/assets/images/brush1.png')
brush.photos.attach(io: File.open(brush1) , filename: 'brush1.png')

brush2 = File.join(Rails.root,'app/assets/images/brush2.jpg')
brush.photos.attach(io: File.open(brush2) , filename: 'brush2.jpg')

v_brow_styler = ProductBenefit.create!(product: brow_styler, benefit: vegan)
cruelty_brow_styler = ProductBenefit.create!(product: brow_styler, benefit: cruelty_free)

# HIGHLIGHTER BRUSH

highlighter_brush = Product.create!(
  title: "Highlighter Brush",
  lb_id: "LB00007",
  measurement: "",
  department: makeup,
  category: tools,
  sub_category: sub_tools,
  brand: beauty_edit_mayfair,
  price_cents: 1800,
  demoable: true,
  details: "Ensures perfect precision. This brush effortlessly blends a brow highlighter pencil which helps to define the brow bone and create a sought-after shape. It is also handy for applying concealer on delicate areas.",
  published: true
)

highlighter_brush_shade = Shade.create!(name: "", sku: "HB01", product: highlighter_brush)

highlighter_brush1 = File.join(Rails.root,'app/assets/images/highlighter_brush1.png')
highlighter_brush_shade.photos.attach(io: File.open(highlighter_brush1) , filename: 'highlighter_brush1.png')

highlighter_brush2 = File.join(Rails.root,'app/assets/images/highlighter_brush2.jpg')
highlighter_brush_shade.photos.attach(io: File.open(highlighter_brush2) , filename: 'brush2.jpg')

v_highlighter_brush = ProductBenefit.create!(product: highlighter_brush, benefit: vegan)
cruelty_highlighter_brush = ProductBenefit.create!(product: highlighter_brush, benefit: cruelty_free)


# BROW LIFT RECOMMENDED

brow_lift_rec_1 = RecommendedProduct.create!(recommender: brow_lift, recommended: brow_filler)
brow_lift_rec_2 = RecommendedProduct.create!(recommender: brow_lift, recommended: brow_setter)
brow_lift_rec_3 = RecommendedProduct.create!(recommender: brow_lift, recommended: brow_styler)
brow_lift_rec_4 = RecommendedProduct.create!(recommender: brow_lift, recommended: highlighter_brush)

# BROW FILLER RECOMMENDED

brow_filler_rec_1 = RecommendedProduct.create!(recommender: brow_filler, recommended: brow_lift)
brow_filler_rec_2 = RecommendedProduct.create!(recommender: brow_filler, recommended: brow_setter)
brow_filler_rec_3 = RecommendedProduct.create!(recommender: brow_filler, recommended: brow_styler)
brow_filler_rec_4 = RecommendedProduct.create!(recommender: brow_filler, recommended: highlighter_brush)

# BROW SETTER RECOMMENDED

brow_setter_rec_1 = RecommendedProduct.create!(recommender: brow_setter, recommended: brow_lift)
brow_setter_rec_2 = RecommendedProduct.create!(recommender: brow_setter, recommended: brow_filler)
brow_setter_rec_3 = RecommendedProduct.create!(recommender: brow_setter, recommended: brow_styler)
brow_setter_rec_4 = RecommendedProduct.create!(recommender: brow_setter, recommended: highlighter_brush)

# BROW STYLER RECOMMENDED

brow_styler_rec_1 = RecommendedProduct.create!(recommender: brow_styler, recommended: brow_lift)
brow_styler_rec_2 = RecommendedProduct.create!(recommender: brow_styler, recommended: brow_filler)
brow_styler_rec_3 = RecommendedProduct.create!(recommender: brow_styler, recommended: brow_setter)
brow_styler_rec_4 = RecommendedProduct.create!(recommender: brow_styler, recommended: highlighter_brush)

# HIGHLIGHTER BRUSH RECOMMENDED

highlighter_brush_rec_1 = RecommendedProduct.create!(recommender: highlighter_brush, recommended: brow_lift)
highlighter_brush_rec_2 = RecommendedProduct.create!(recommender: highlighter_brush, recommended: brow_filler)
highlighter_brush_rec_3 = RecommendedProduct.create!(recommender: highlighter_brush, recommended: brow_setter)
highlighter_brush_rec_4 = RecommendedProduct.create!(recommender: highlighter_brush, recommended: brow_styler)

puts "-"

# CREATING INFLUENCERS

puts "CREATING INFLUENCERS"

esther = User.new(description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.", published: true, influencer: true, first_name: "Esther", last_name: "Areola", instagram: "@estaregrams", instagram_followers: '244k', youtube: 'https://www.youtube.com/user/EstAreLIVE/featured', youtube_subscribers: '187k', password: "Esther123", email: "esther@estareonline.com")
ropo = User.new(description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.", published: true, influencer: true, first_name: "Ropo", last_name: "Demure", instagram: "@ropo.demure", instagram_followers: '55k', youtube: 'https://www.youtube.com/user/22ropoable', youtube_subscribers: '123k', password: "Ropo123", email: "ropo_demuren@gmail.com")
breeny = User.new(description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.", published: true, influencer: true, first_name: "Breeny", last_name: "Lee", instagram: "@breenylee", instagram_followers: '132k', youtube: 'https://www.youtube.com/user/BreenyLee', youtube_subscribers: '299k', password: "Breeny123", email: "info.breenylee@gmail.com")
nikki = User.new(description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.", published: true, influencer: true, first_name: "Nikki", last_name: "Patel", instagram: "@nikkissecretx", instagram_followers: '433k', youtube: 'https://www.youtube.com/user/N1kk1sSecr3t', youtube_subscribers: '172k', password: "Nikki123", email: "nicky.o.patel@gmail.com")
shantania = User.new(description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.", published: true, influencer: true, first_name: "Shantania", last_name: "Beckford", instagram: "@shantaniabeckford", instagram_followers: '241k', youtube: 'https://www.youtube.com/channel/UC6jaD2FmAFXL7dsHgzCDy3w', youtube_subscribers: '319k', password: "Shantania123", email: "shantaniabeckford@gmail.com")
bemi = User.new(description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.", published: true, influencer: true, first_name: "Bemi", last_name: "Akinde", instagram: "@beautybybemii",instagram_followers: '18k', youtube: 'https://www.youtube.com/channel/UC1sEM6rvD-EtmmCc9ZMm7PQ', youtube_subscribers: '123k', password: "Bemi123", email: "beautybybemi@gmail.com")

esther_cover = File.join(Rails.root,'app/assets/images/esther_cover.jpg')
esther.cover_photo.attach(io: File.open(esther_cover) , filename: 'esther_cover.jpg')

esther_avatar = File.join(Rails.root,'app/assets/images/esther_avatar.jpg')
esther.avatar_photo.attach(io: File.open(esther_avatar) , filename: 'esther_avatar.jpg')

esther_cover = File.join(Rails.root,'app/assets/images/esther_cover.jpg')
esther.qa_photo.attach(io: File.open(esther_cover) , filename: 'esther_cover.jpg')

esther_avatar = File.join(Rails.root,'app/assets/images/esther_avatar.jpg')
esther.lookbook_photo.attach(io: File.open(esther_avatar) , filename: 'esther_avatar.jpg')

esther_avatar = File.join(Rails.root,'app/assets/images/esther_avatar.jpg')
esther.tutorial_photo.attach(io: File.open(esther_avatar) , filename: 'esther_avatar.jpg')

esther_makeup = File.join(Rails.root,'app/assets/images/makeup_photo.jpg')
esther.makeup_photo.attach(io: File.open(esther_makeup) , filename: 'makeup_photo.jpg')



ropo_cover = File.join(Rails.root,'app/assets/images/ropo_cover.jpg')
ropo.cover_photo.attach(io: File.open(ropo_cover) , filename: 'ropo_cover.jpg')

ropo_avatar = File.join(Rails.root,'app/assets/images/ropo_avatar.jpg')
ropo.avatar_photo.attach(io: File.open(ropo_avatar) , filename: 'ropo_avatar.jpg')

ropo_cover = File.join(Rails.root,'app/assets/images/ropo_cover.jpg')
ropo.lookbook_photo.attach(io: File.open(ropo_cover) , filename: 'ropo_cover.jpg')

ropo_avatar = File.join(Rails.root,'app/assets/images/ropo_avatar.jpg')
ropo.qa_photo.attach(io: File.open(ropo_avatar) , filename: 'ropo_avatar.jpg')

ropo_avatar = File.join(Rails.root,'app/assets/images/ropo_avatar.jpg')
ropo.tutorial_photo.attach(io: File.open(ropo_avatar) , filename: 'ropo_avatar.jpg')

ropo_makeup = File.join(Rails.root,'app/assets/images/makeup_photo.jpg')
ropo.makeup_photo.attach(io: File.open(ropo_makeup) , filename: 'makeup_photo.jpg')



breeny_cover = File.join(Rails.root,'app/assets/images/breeny_cover.jpg')
breeny.cover_photo.attach(io: File.open(breeny_cover) , filename: 'breeny_cover.jpg')

breeny_avatar = File.join(Rails.root,'app/assets/images/breeny_avatar.jpg')
breeny.avatar_photo.attach(io: File.open(breeny_avatar) , filename: 'breeny_avatar.jpg')

breeny_cover = File.join(Rails.root,'app/assets/images/breeny_cover.jpg')
breeny.qa_photo.attach(io: File.open(breeny_cover) , filename: 'breeny_cover.jpg')

breeny_avatar = File.join(Rails.root,'app/assets/images/breeny_avatar.jpg')
breeny.lookbook_photo.attach(io: File.open(breeny_avatar) , filename: 'breeny_avatar.jpg')

breeny_avatar = File.join(Rails.root,'app/assets/images/breeny_avatar.jpg')
breeny.tutorial_photo.attach(io: File.open(breeny_avatar) , filename: 'breeny_avatar.jpg')

breeny_makeup = File.join(Rails.root,'app/assets/images/makeup_photo.jpg')
breeny.makeup_photo.attach(io: File.open(breeny_makeup) , filename: 'makeup_photo.jpg')




nikki_cover = File.join(Rails.root,'app/assets/images/nikki_cover.jpg')
nikki.cover_photo.attach(io: File.open(nikki_cover) , filename: 'nikki_cover.jpg')

nikki_avatar = File.join(Rails.root,'app/assets/images/nikki_avatar.jpg')
nikki.avatar_photo.attach(io: File.open(nikki_avatar) , filename: 'nikki_avatar.jpg')

nikki_cover = File.join(Rails.root,'app/assets/images/nikki_cover.jpg')
nikki.qa_photo.attach(io: File.open(nikki_cover) , filename: 'nikki_cover.jpg')

nikki_avatar = File.join(Rails.root,'app/assets/images/nikki_avatar.jpg')
nikki.lookbook_photo.attach(io: File.open(nikki_avatar) , filename: 'nikki_avatar.jpg')

nikki_avatar = File.join(Rails.root,'app/assets/images/nikki_avatar.jpg')
nikki.tutorial_photo.attach(io: File.open(nikki_avatar) , filename: 'nikki_avatar.jpg')

nikki_makeup = File.join(Rails.root,'app/assets/images/makeup_photo.jpg')
nikki.makeup_photo.attach(io: File.open(nikki_makeup) , filename: 'makeup_photo.jpg')



shantania_cover = File.join(Rails.root,'app/assets/images/shantania_cover.jpg')
shantania.cover_photo.attach(io: File.open(shantania_cover) , filename: 'shantania_cover.jpg')

shantania_avatar = File.join(Rails.root,'app/assets/images/shantania_avatar.jpg')
shantania.avatar_photo.attach(io: File.open(shantania_avatar) , filename: 'shantania_avatar.jpg')

shantania_cover = File.join(Rails.root,'app/assets/images/shantania_cover.jpg')
shantania.qa_photo.attach(io: File.open(shantania_cover) , filename: 'shantania_cover.jpg')

shantania_avatar = File.join(Rails.root,'app/assets/images/shantania_avatar.jpg')
shantania.lookbook_photo.attach(io: File.open(shantania_avatar) , filename: 'shantania_avatar.jpg')

shantania_avatar = File.join(Rails.root,'app/assets/images/shantania_avatar.jpg')
shantania.tutorial_photo.attach(io: File.open(shantania_avatar) , filename: 'shantania_avatar.jpg')

shantania_makeup = File.join(Rails.root,'app/assets/images/makeup_photo.jpg')
shantania.makeup_photo.attach(io: File.open(shantania_makeup) , filename: 'makeup_photo.jpg')



bemi_cover = File.join(Rails.root,'app/assets/images/bemi_cover.jpg')
bemi.cover_photo.attach(io: File.open(bemi_cover) , filename: 'bemi_cover.jpg')

bemi_avatar = File.join(Rails.root,'app/assets/images/bemi_avatar.jpg')
bemi.avatar_photo.attach(io: File.open(bemi_avatar) , filename: 'bemi_avatar.jpg')

bemi_cover = File.join(Rails.root,'app/assets/images/bemi_cover.jpg')
bemi.qa_photo.attach(io: File.open(bemi_cover) , filename: 'bemi_cover.jpg')

bemi_avatar = File.join(Rails.root,'app/assets/images/bemi_avatar.jpg')
bemi.lookbook_photo.attach(io: File.open(bemi_avatar) , filename: 'bemi_avatar.jpg')

bemi_avatar = File.join(Rails.root,'app/assets/images/bemi_avatar.jpg')
bemi.tutorial_photo.attach(io: File.open(bemi_avatar) , filename: 'bemi_avatar.jpg')

bemi_makeup = File.join(Rails.root,'app/assets/images/makeup_photo.jpg')
bemi.makeup_photo.attach(io: File.open(bemi_makeup) , filename: 'makeup_photo.jpg')



esther.save
ropo.save
breeny.save
nikki.save
shantania.save
bemi.save

puts "-"

# CREATING SHOWROOM

puts "CREATING SHOWROOM"


estherShowroom = Showroom.create!(user: esther)
ropoShowroom = Showroom.create!(user: ropo)
breenyShowroom = Showroom.create!(user: breeny)
shantaniaShowroom = Showroom.create!(user: shantania)
bemiShowroom = Showroom.create!(user: bemi)
nikkiShowroom = Showroom.create!(user: nikki)

estherProd = ShowroomProduct.create!(showroom: estherShowroom, product: brow_lift)
ropoProd = ShowroomProduct.create!(showroom: ropoShowroom, product: brow_setter)
breenyProd = ShowroomProduct.create!(showroom: breenyShowroom, product: brow_setter)
shantaniaProd = ShowroomProduct.create!(showroom: shantaniaShowroom, product: brow_setter)
bemiProd = ShowroomProduct.create!(showroom: bemiShowroom, product: brow_setter)
nikkiProd = ShowroomProduct.create!(showroom: nikkiShowroom, product: brow_setter)

#CREATING WISHLIST

# puts "Creating influencer wishlist"

# estherWishlist = Wishlist.create!(user: esther)
# ropoWishlist = Wishlist.create!(user: ropo)
# breenyWishlist = Wishlist.create!(user: breeny)
# shantaniaWishlist = Wishlist.create!(user: shantania)
# bemiWishlist = Wishlist.create!(user: bemi)
# nikkiWishlist = Wishlist.create!(user: nikki)

# 4.times do
# estherProd = WishlistProduct.new(wishlist: estherWishlist, product: Product.all.sample)
# estherProd.shade = estherProd.product.shades.first
# estherProd.save
# end

# 4.times do
# ropoProd = WishlistProduct.new(wishlist: ropoWishlist, product: Product.all.sample)
# ropoProd.shade = ropoProd.product.shades.first
# ropoProd.save
# end

# 4.times do
# breenyProd = WishlistProduct.new(wishlist: breenyWishlist, product: Product.all.sample)
# breenyProd.shade = breenyProd.product.shades.first
# breenyProd.save
# end

# 4.times do
# shantaniaProd = WishlistProduct.new(wishlist: shantaniaWishlist, product: Product.all.sample)
# shantaniaProd.shade = shantaniaProd.product.shades.first
# shantaniaProd.save
# end

# 4.times do
# bemiProd = WishlistProduct.new(wishlist: bemiWishlist, product: Product.all.sample)
# bemiProd.shade = bemiProd.product.shades.first
# bemiProd.save
# end

# 4.times do
# nikkiProd = WishlistProduct.new(wishlist: nikkiWishlist, product: Product.all.sample)
# nikkiProd.shade = nikkiProd.product.shades.first
# nikkiProd.save
# end

puts "-"

insiders = [esther, ropo, breeny, nikki, shantania, bemi]

# CREATING CUSTOMER USER

puts "CREATING CUSTOMERS"

ariel = User.create!(published: true, influencer: false, first_name: "Ariel", last_name: "Roberts", country: "Bristol, UK",password: "Ariel123", email: "ariel@gmail.com")
lenny = User.create!(published: true, influencer: false, first_name: "Leonard", last_name: "Percival", country: "Oxford, UK",password: "Lenny123", email: "lenny@gmail.com")
ife = User.create!(published: true, influencer: false, first_name: "Ife", last_name: "Odugbesan", country: "London, UK",password: "Ife123", email: "ife@gmail.com")
wrighty = User.create!(published: true, influencer: false, first_name: "Ben", last_name: "Wright", country: "London, UK",password: "Wrighty123", email: "wrighty@gmail.com")
customers = [ariel, lenny, ife]
# CREATING ADMIN USER

puts "-"

puts "CREATING CUSTOMER WISHLIST"

arielWishlist = Wishlist.create!(user: ariel)
lennyWishlist = Wishlist.create!(user: lenny)
ifeWishlist = Wishlist.create!(user: ife)
wrightyWishlist = Wishlist.create!(user: wrighty)

# 4.times do
# arielProd = WishlistProduct.new(wishlist: arielWishlist, product: Product.all.sample)
# arielProd.shade = arielProd.product.shades.first
# arielProd.save
# end

# 4.times do
# lennyProd = WishlistProduct.new(wishlist: lennyWishlist, product: Product.all.sample)
# lennyProd.shade = lennyProd.product.shades.first
# lennyProd.save
# end

# 4.times do
# ifeProd = WishlistProduct.new(wishlist: ifeWishlist, product: Product.all.sample)
# ifeProd.shade = ifeProd.product.shades.first
# ifeProd.save
# end

# 4.times do
# wrightyProd = WishlistProduct.new(wishlist: wrightyWishlist, product: Product.all.sample)
# wrightyProd.shade = wrightyProd.product.shades.first
# wrightyProd.save
# end

puts "-"

puts "CREATING ADMIN USER"

admin = User.create!(influencer: false, first_name: "contact", last_name: "hoxton", password: "Admin123", email: "admin@gmail.com", admin: true)

puts "-"
puts "***********************"
puts "EMAIL: admin@gmail.com"
puts "PASSWORD: Admin123"
puts "***********************"
puts "-"

# CREATING INSIDER ARTICLES

puts "CREATING INSIDER ARTICLES"

# 5.times do

  esther_article = InsiderArticle.create!(
    by: "Esther Areola",
    category: "Ask the expert",
    title: "3 BEAUTY TRICKS WE LEARNT BACKSTAGE AT AUSTRALIAN FASHION WEEK",
    user: admin,
    text1: "Fashion Week is a huge week for anyone - between witnessing expert hair and makeup artists work their magic (while under a serious time crunch),
    previewing new season collections from our favourite brands AND taking note of the incredible street style outfits and beauty looks, it’s all a lot to take in.
    And while it may all seem completely overwhelming (or for me, anyway), there are always a few tidbits worth mentioning; straight from the hair and makeup artists
    themselves, these are the beauty lessons and tips we learnt backstage that we will be swearing by from now on.  ",
    text2: "1. Prepping skin is the single most important step.\n\nIt’s so easy to get lazy, but creating a flawless makeup look really starts with good skincare.
    Making sure you cleanse properly is one thing, but following with an exfoliation treatment is the key to a smooth, fresh complexion that will serve as a
    perfect base for makeup. Emma Hobson, the Education Manager for the International Dermal Institute and Dermalogica explains backstage at Hansen & Gretel;
    exfoliation is what 'gives that really smooth, healthy glow and smooth palette, particularly if [the models] aren’t putting foundation on'. She recommends
    Dermalogica Daily Resurfacer. Makeup artist and director at Lee Mathews, Claire Thompson agrees; 'I feel that’s where makeup and skin is headed now - it’s
    elevated and the quality is going into skin care, rather than making an impact with the base.'",
    text3: "2. Manipulating your foundation is the key to the perfect dewy finish.\n\n
    Glowing skin is in, and we have it from good authority that a dewy, radiant foundation finish isn’t going anywhere, anytime soon. So when we chatted to
    Lara Srokowski, Lancome’s National Makeup Artist, we were super excited to learn her trick for achieving the perfect textured makeup base. 'We’ve used our
    Lancome Absolue Precious Oil, so the oil has given that really beautiful dewy base before we even apply makeup. We’ve [then] used Ultra Wear Foundation, which
    s actually a medium to full coverage foundation but we’ve manipulated the texture by adding a few drops of the oil into the foundation. [This] then gives it that
    ‘second skin’ finish, and because we do the models makeup so many hours before, we wanted that long-wearing effect where we don’t need to do any retouches,'' but
      still be able to maintain that gorgeous, dewy finish, explains Lara about the makeup for the AJE opening show.",
    text4: "3. Blush is back in a big way.\n\n
    Lee Mathews and Karla Spetic proved that blush is back and we couldn’t be more excited about it. Moving away from the overpowering and over-powdered look we
    grew up terrified of, the hero products of Australian Fashion Week were cream and liquid blush formulas, specifically The Body Shop Lip and Cheek Stain in Deep
    Berry and Pink Hibiscus and Westman Atelier Baby Cheek Blush Stick (find it at mecca.com.au, $76) . 'We applied with fingers, dabbing high on the cheek bones,
    under the eye bone and across the nose to give [a] fresh, flushed look,' explained The Body Shop makeup artist at Karla Spetic.",
    cover_alt_text: "esther cover",
    photo1_alt_text: "esther photo one",
    photo2_alt_text: "esther photo two",
    photo3_alt_text: "esther photo three",
    published: true
  )

  esther_article_cover = File.join(Rails.root,'app/assets/images/esther_article_cover.jpg')
  esther_article.cover_photo.attach(io: File.open(esther_article_cover) , filename: 'esther_article_cover.jpg')

  esther_photo_one = File.join(Rails.root,'app/assets/images/esther_photo_one.jpg')
  esther_article.photo1.attach(io: File.open(esther_photo_one) , filename: 'esther_photo_one.jpg')

  esther_photo_two = File.join(Rails.root,'app/assets/images/esther_photo_two.jpg')
  esther_article.photo2.attach(io: File.open(esther_photo_two) , filename: 'esther_photo_two.jpg')

  esther_photo_three = File.join(Rails.root,'app/assets/images/esther_photo_three.jpg')
  esther_article.photo3.attach(io: File.open(esther_photo_three) , filename: 'esther_photo_three.jpg')


  ropo_article = InsiderArticle.create!(
                                          by: "Ropo Demure",
                                          category: "Lifestyle",
                                          title: "THE BEST CONCEALER FOR DRY SKIN",
                                          user: admin,
                                          text1: "Hiding dark circles with concealer after a late night is one thing, but when you combine that with skin that’s as dry as the Sahara desert –
                                          the result is a flaky, creasing mess. Dry skin can be a nightmare to work with when you’re applying makeup. Which is why you need to find the right formula
                                          to hydrate and smooth over dry patches, rather than accentuate them.",
                                          text2: "How do you choose a concealer for dry skin?\n\n
                                          The most important thing to remember is hydration, hydration, hydration. Martine recommends choosing creamy or liquid formulas as they’re more hydrating.
                                          'You don’t want a concealer that is dry in its consistency as this will only make the skin and any dry areas appear worse and more textured.'",
                                          text3: "Which types of concealers are standouts for dry skin?\n\n
                                          When it comes to choosing a formula, you want to look out for concealers with a creamy consistency as they tend to work better on dry skin.
                                          The next step is to choose the right ingredients. 'Look for concealers that are filled with hydrating ingredients such as Moringa Seed Oil – which
                                          conditions, moisturisers and soothes the skin – and Algae Extract – which helps to prevent trans epidermal water loss,' recommends Martine.",
                                          text4: "What other makeup products do you recommend for dry skin?\n\n
                                          Martine suggests using a facial serum or oil, followed by a rich facial moisturiser, to help give the skin a plump, moisturised appearance.
                                          'Foundation wise I would recommend using a liquid foundation with a dewy finish, as this will give the illusion of more hydrated skin,' she says.
                                          And you can’t go past a hydration spray! 'These can be used throughout the day to add a boost of hydration to your skin, keeping it looking plump and fresh.'",
                                          cover_alt_text: "ropo cover",
                                          photo1_alt_text: "ropo photo one",
                                          photo2_alt_text: "ropo photo two",
                                          photo3_alt_text: "ropo photo",
                                          published: true
                                          )

  ropo_article_cover = File.join(Rails.root,'app/assets/images/ropo_article_cover.jpg')
  ropo_article.cover_photo.attach(io: File.open(ropo_article_cover) , filename: 'ropo_article_cover.jpg')

  ropo_photo_one = File.join(Rails.root,'app/assets/images/ropo_photo_one.jpg')
  ropo_article.photo1.attach(io: File.open(ropo_photo_one) , filename: 'ropo_photo_one.jpg')

  ropo_photo_two = File.join(Rails.root,'app/assets/images/ropo_photo_two.jpg')
  ropo_article.photo2.attach(io: File.open(ropo_photo_two) , filename: 'ropo_photo_two.jpg')

  ropo_photo_three = File.join(Rails.root,'app/assets/images/ropo_photo_three.jpg')
  ropo_article.photo3.attach(io: File.open(ropo_photo_three) , filename: 'ropo_photo_three.jpg')


  breeny_article = InsiderArticle.create!(
                                          by: "Breeny Lee",
                                          category: "Inspiration",
                                          title: "It's Never Too Late To Get In The Makeup Game",
                                          user: admin,
                                          text1: "In middle school I wore thick black eyeliner all over my eyelids and about an inch below them as well with nothing else, not even mascara. In high
                                          school, I would either wear no makeup or black eyeliner in my entire waterline and maaaaaybe some mascara, but nothing else. Then I stopped wearing makeup
                                          completely for like five years except for 'special occasions' when I would wear the black eyeliner/mascara combo.",
                                          text2: "A little over a year ago I got one of those Ulta deals where if you spend $20 on Ulta brand products, you get a makeup bag full of stuff. I got one
                                          of their palettes, which I've since given away, and used the makeup that came in the GWP bag for a little bit. I got roped into buying this Mary Kay starter
                                          kit which was a terrible decision, but I ended up using their powder foundation which actually isn't that bad. That was the first foundation I ever wore since
                                          he couple times I had tried liquid foundation I thought it felt weird on my skin.",
                                          text3: "That was my routine for about nine months until I found this subreddit, and subsequently the YouTube makeup community, and decided I wanted to start
                                          learning more about makeup. I really started getting into it in February of this year and even though it hasn't been that long, I think I've come really far.
                                          I've spent way too much money trying out tons of products and spent a lot of nights practicing makeup, wiping it off, and then practicing again.",
                                          text4: "I've completely immersed myself in learning about makeup and it's given me so much more confidence. I've always been self conscious about my appearance
                                          but it's better now than it ever has been. People in my life are surprised that I've suddenly become so into something I had never shown interest in, and at
                                          times criticized, but I've received a ton of positive feedback and compliments on my makeup since I've started getting better. Obviously there's still a ton
                                          of stuff I can learn, but I feel like practicing as much as I have has made me pretty skilled in a relatively short period of time.",
                                          cover_alt_text: "breeny cover",
                                          photo1_alt_text: "breeny photo one",
                                          photo2_alt_text: "breeny photo two",
                                          photo3_alt_text: "breeny photo three",
                                          published: true
                                          )

  breeny_article_cover = File.join(Rails.root,'app/assets/images/breeny_article_cover.jpg')
  breeny_article.cover_photo.attach(io: File.open(breeny_article_cover) , filename: 'breeny_article_cover.jpg')

  breeny_photo_one = File.join(Rails.root,'app/assets/images/breeny_photo_one.jpg')
  breeny_article.photo1.attach(io: File.open(breeny_photo_one) , filename: 'breeny_photo_one.jpg')

  breeny_photo_two = File.join(Rails.root,'app/assets/images/breeny_photo_two.jpg')
  breeny_article.photo2.attach(io: File.open(breeny_photo_two) , filename: 'breeny_photo_two.jpg')

  breeny_photo_three = File.join(Rails.root,'app/assets/images/breeny_photo_three.jpg')
  breeny_article.photo3.attach(io: File.open(breeny_photo_three) , filename: 'breeny_photo_three.jpg')


  nikki_article = InsiderArticle.create!(
                                          by: "Nikki Patel",
                                          category: "Ask the expert",
                                          title: "Your Everyday Makeup Questions, Answered",
                                          user: admin,
                                          text1: "A big night out may be a good excuse for a fun new makeup look, but most of us need our makeup to work Monday through Friday, and we count on a few
                                          reliable products to get the job done. Unless you’re ready to risk a faux pas — your smoky eye gone singed, let’s say — the workweek isn’t the best time to
                                          go experimental. Instead, we offer advice from experts on the best ways to apply your daily makeup and, along the way, clear up a few confounding makeup
                                          questions.",
                                          text2: "How do I determine which foundation is best for me?\n\n
                                          Skin type plays a key role, but Ms. Greenberg would argue that most people already know their skin type. The issue, she says, is more nuanced. 'You have to
                                          think, ‘Is your foundation compatible with your moisturizer?’ As you know, water and oil don’t mix, so if you’re using, say, an oil-based moisturizer and
                                          water-based foundation, you might have an unwanted pilling effect.' This remains true throughout the seasons, she points out, so you may want to pair a
                                          water-based foundation with a water-based moisturizer during the summer but switch to oil-based products in the winter.",
                                          text3: "Why do some base products look more natural than others?\n\n
                                          Whether or not a base looks natural hinges on texture and consistency. Generally, matte or thicker foundations will have a more artificial-looking finish.
                                          Natural skin tends to reflect a bit of light. Ms. Greenberg also finds that color plays an outsize role. 'The No. 1 issue I see is that the color is off,'
                                          she says. She suggests that it might be worth it to buy two foundations, one light and one dark. Then practice mixing them and adjusting as needed. 'Don’t
                                          forget that skin color can change every day depending on the season or exposure to sun,' she says. Another tip for a flawless finish: 'It sounds crazy,
                                          but I have combination skin, and I’ll often use two different foundations in the same shade,' Ms. Greenberg says. 'I’ll use one that is more oil-absorbing
                                          for my T-zone and one that is dewier for the rest of my face.'",
                                          text4: "Should I wear a primer underneath my makeup?\n\n
                                          Primer can be a controversial topic, and even professionals are divided. Well-known makeup artists hail its effectiveness in creating a smoother surface
                                          for makeup, evening out skin texture and providing longer-lasting wear. Others insist that primer serves only a minimal purpose for the general population.
                                            Jamie Greenberg, a makeup artist who often works with the actress Rashida Jones, suggests thinking of primer as a problem solver. 'If you find yourself
                                            having trouble keeping your makeup in place, and you’ve already tried different foundation formulas, you might want to try a primer,' she says. 'It will
                                            make your makeup last longer, so if you have a special meeting or aren’t able to touch up during the day, it helps.' Generally, Ms. Greenberg finds that
                                            a good primer can get you “four hours where your makeup will look top-notch.' Apply it all over with a flat foundation brush. It adds a few minutes to
                                            your morning makeup routine, but it can save you time on touchups.",
                                          cover_alt_text: "",
                                          photo1_alt_text: "",
                                          photo2_alt_text: "",
                                          photo3_alt_text: "",
                                          published: true
                                          )

  nikki_article_cover = File.join(Rails.root,'app/assets/images/nikki_article_cover.jpg')
  nikki_article.cover_photo.attach(io: File.open(nikki_article_cover) , filename: 'nikki_article_cover.jpg')

  nikki_photo_one = File.join(Rails.root,'app/assets/images/nikki_photo_one.jpg')
  nikki_article.photo1.attach(io: File.open(nikki_photo_one) , filename: 'nikki_photo_one.jpg')

  nikki_photo_two = File.join(Rails.root,'app/assets/images/nikki_photo_two.jpg')
  nikki_article.photo2.attach(io: File.open(nikki_photo_two) , filename: 'nikki_photo_two.jpg')

  nikki_photo_three = File.join(Rails.root,'app/assets/images/nikki_photo_three.jpg')
  nikki_article.photo3.attach(io: File.open(nikki_photo_three) , filename: 'nikki_photo_three.jpg')


  shantania_article = InsiderArticle.create!(
                                          by: "Shantania Beckford",
                                          category: "Lifestyle",
                                          title: "Look flawless every day with super-easy makeup tips",
                                          user: admin,
                                          text1: "First, you should use your fingers to dab the foundation in 4 spots on your face: Forehead, both the cheeks, and the chin. Then use the brush to
                                          blend it. On your forehead and chin, brush back and forth. On your cheeks, brush down and away from the centre of your face.",
                                          text2: "Add a drop of moisturizer to your brush before adding the concealer. Then dab the product about 4 times under your eyes. Smoothen with the brush,
                                          then use your middle finger to lightly dab it underneath your eyes. The heat of your finger blends the concealer even more for a really natural finish.",
                                          text3: "Forget shading and sculpting cheekbones with a brush and powder, and try a cream blush instead for that glow-from-within effect.  Apply to the
                                          apples of your cheeks; the fast way to find yours: Smile! Then blend the colour up toward your temples with your fingers. Bright, bold hues like the
                                          berry shade can look natural, but if you’re colour-shy, build the intensity by gradually layering it on.",
                                          text4: "For a pro-looking eye makeup in no time, apply a wash of sheer, shimmery cream shadow from lash lines to brow bones using your pointer finger.
                                          Bonus: Shimmer helps hide stray eyebrow hairs if you don’t have time to tweeze! If your skin is fair, try a silvery white shade. For medium to dark skin
                                          tone, opt for a champagne colour. To get an extra bright-eyed effect, dot the colour onto the inner corners of your eyes too. Celebs use this trick on
                                          the red carpet all the time.",
                                          cover_alt_text: "shantania cover",
                                          photo1_alt_text: "shantania photo one",
                                          photo2_alt_text: "shantania photo two",
                                          photo3_alt_text: "shantania photo three",
                                          published: true,
                                          featured: true
                                          )

  shantania_article_cover = File.join(Rails.root,'app/assets/images/shantania_article_cover.jpg')
  shantania_article.cover_photo.attach(io: File.open(shantania_article_cover) , filename: 'shantania_article_cover.jpg')

  shantania_photo_one = File.join(Rails.root,'app/assets/images/shantania_photo_one.jpg')
  shantania_article.photo1.attach(io: File.open(shantania_photo_one) , filename: 'shantania_photo_one.jpg')

  shantania_photo_two = File.join(Rails.root,'app/assets/images/shantania_photo_two.jpg')
  shantania_article.photo2.attach(io: File.open(shantania_photo_two) , filename: 'shantania_photo_two.jpg')

  shantania_photo_three = File.join(Rails.root,'app/assets/images/shantania_photo_three.jpg')
  shantania_article.photo3.attach(io: File.open(shantania_photo_three) , filename: 'shantania_photo_three.jpg')


  bemi_article = InsiderArticle.create!(
                                          by: "Bemi Akinde",
                                          category: "Inspiration",
                                          title: "From Covering Acne To Beginning To Love Makeup",
                                          user: admin,
                                          text1: "My parents are well-off, but I've always been money-conscious (they were immigrants and were not always well off) so I was strictly drugstore for a
                                          long time. I started wearing foundation in middle school because I had really bad acne and scars and hyperpigmentation as a result. I didn't really wear any
                                          other makeup, just heavy foundation and perhaps some powder to set it if needed. This continued through high school. I think I was popular in the sense that
                                          I had friends across different groups and got along with almost everyone, but I wasn't one of the pretty, popular girls in high school. More like the nice girl.
                                          My sister was (and is) very pretty and really got into makeup and hair starting in high school. I would hear her alarm go off very early in the morning and I
                                          knew she had started her routine while I slept for another hour.",
                                          text2: "My teenage years and even a lot of my twenties involved frequent dermatologist visits. I've been advised pretty much everything under the sun, including
                                          sitting out in the sun (without sunscreen). Anything to do with my looks made me miserable and dermatologist visits usually left me crying later. I got sick of
                                            the 'We'll have this cleared up before next year!' promises and a few doctors even did peels that were too strong and left me with more scars. I also was
                                            prescribed Accutane at one point and did become depressed and suicidal, but that's a topic for another time!",
                                          text3: "I'm basically going into this because for me, makeup and the quality of my skin has always been intertwined. It wasn't something fun, it was a chore that
                                          I hated and it reminded me of how messed up the 'real me' looked. I didn't play around with blush, lipstick, eyeshadow, anything. I hated all of it. It didn't
                                          help that I was a brown person living in a white area and had a very difficult time finding foundation that remotely matched me.",
                                          text4: "I'm in my 30s now, got divorced and am getting married again. I decided to do my own makeup for the wedding and subscribed to all these makeup
                                          subreddits. I'm trying to learn how to have fun with makeup, and you guys have really made that possible. I've spent a small fortune at Sephora, but I feel
                                          good about all my purchases.",
                                          cover_alt_text: "bemi cover",
                                          photo1_alt_text: "bemi photo one",
                                          photo2_alt_text: "bemi photo two",
                                          photo3_alt_text: "bemi photo three",
                                          published: true
                                          )

  bemi_article_cover = File.join(Rails.root,'app/assets/images/bemi_article_cover.jpg')
  bemi_article.cover_photo.attach(io: File.open(bemi_article_cover) , filename: 'bemi_article_cover.jpg')

  bemi_photo_one = File.join(Rails.root,'app/assets/images/bemi_photo_one.jpg')
  bemi_article.photo1.attach(io: File.open(bemi_photo_one) , filename: 'bemi_photo_one.jpg')

  bemi_photo_two = File.join(Rails.root,'app/assets/images/bemi_photo_two.jpg')
  bemi_article.photo2.attach(io: File.open(bemi_photo_two) , filename: 'bemi_photo_two.jpg')

  bemi_photo_three = File.join(Rails.root,'app/assets/images/bemi_photo_three.jpg')
  bemi_article.photo3.attach(io: File.open(bemi_photo_three) , filename: 'bemi_photo_three.jpg')

# end

puts "-"

# CREATING TUTORIALS

puts "CREATING TUTORIALS"

esther_tutorial = Tutorial.create!(
                                      user: esther,
                                      status: "approved",
                                      title: "Perfect nude lip for dark skin",
                                      category: 'ask the expert',
                                      featured: true
                                      )

puts "#{esther_tutorial.featured}"

esther_video_cover = File.join(Rails.root,'app/assets/images/esther_cover.jpg')
esther_tutorial.cover_photo.attach(io: File.open(esther_video_cover) , filename: 'esther_cover.jpg')
esther_video = File.join(Rails.root,'app/assets/images/esther-vid.mp4')
esther_tutorial.video.attach(io: File.open(esther_video) , filename: 'esther-vid.mp4')
esther_tutorial.approve!

breeny_tutorial = Tutorial.create!(
                                      user: breeny,
                                      status: "approved",
                                      title: "Sleek cream contour kit in extra dark",
                                      category: 'tutorial'
                                      )

breeny_video_cover = File.join(Rails.root,'app/assets/images/breeny_cover.jpg')
breeny_tutorial.cover_photo.attach(io: File.open(breeny_video_cover) , filename: 'breeny_cover.jpg')
breeny_video = File.join(Rails.root,'app/assets/images/breeny-vid.mp4')
breeny_tutorial.video.attach(io: File.open(breeny_video) , filename: 'breeny-vid.mp4')
breeny_tutorial.approve!


nikki_tutorial = Tutorial.create!(
                                      user: nikki,
                                      status: "approved",
                                      title: "Skincare prep before makeup",
                                      category: 'ask the expert'
                                      )

nikki_video_cover = File.join(Rails.root,'app/assets/images/nikki_cover.jpg')
nikki_tutorial.cover_photo.attach(io: File.open(nikki_video_cover) , filename: 'nikki_cover.jpg')
nikki_video = File.join(Rails.root,'app/assets/images/nikki-vid.mp4')
nikki_tutorial.video.attach(io: File.open(nikki_video) , filename: 'nikki-vid.mp4')
nikki_tutorial.approve!


shantania_tutorial = Tutorial.create!(
                                      user: shantania,
                                      status: "approved",
                                      title: "Everyday drugstore £5 makeup tutorial",
                                      category: 'tutorial'
                                      )

shantania_video_cover = File.join(Rails.root,'app/assets/images/shantania_cover.jpg')
shantania_tutorial.cover_photo.attach(io: File.open(shantania_video_cover) , filename: 'shantania_cover.jpg')
shantania_video = File.join(Rails.root,'app/assets/images/shantania-vid.mp4')
shantania_tutorial.video.attach(io: File.open(shantania_video) , filename: 'shantania-vid.mp4')
shantania_tutorial.approve!

bemi_tutorial = Tutorial.create!(
                                      user: bemi,
                                      status: "approved",
                                      title: "Foundation review | Fenty beauty",
                                      category: 'tutorial'
                                      )

bemi_video_cover = File.join(Rails.root,'app/assets/images/bemi_cover.jpg')
bemi_tutorial.cover_photo.attach(io: File.open(bemi_video_cover) , filename: 'bemi_cover.jpg')
bemi_video = File.join(Rails.root,'app/assets/images/bemi-vid.mp4')
bemi_tutorial.video.attach(io: File.open(bemi_video) , filename: 'bemi-vid.mp4')
bemi_tutorial.approve!


ropo_tutorial = Tutorial.create!(
                                      user: ropo,
                                      status: "approved",
                                      title: "Instagram 'Baddie' inspired makeup",
                                      category: 'tutorial'
                                      )

ropo_video_cover = File.join(Rails.root,'app/assets/images/ropo_cover.jpg')
ropo_tutorial.cover_photo.attach(io: File.open(ropo_video_cover) , filename: 'ropo_cover.jpg')
ropo_video = File.join(Rails.root,'app/assets/images/ropo-vid.mp4')
ropo_tutorial.video.attach(io: File.open(ropo_video) , filename: 'ropo-vid.mp4')
ropo_tutorial.approve!



puts "-"

# CREATING LOOKBOOKS

puts "CREATING LOOKBOOKS"

# [esther, ropo, breeny, nikki, shantania, bemi]


esther_lookbook_one = Lookbook.new(user: esther, title: 'Esther First Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
esther_lookbook_one.product_ids = [1,2,3,4,5,6,7].sample(4)
esther_lookbook_image_one = File.join(Rails.root,'app/assets/images/esther_photo_one.jpg')
esther_lookbook_one.photo.attach(io: File.open(esther_lookbook_image_one) , filename: 'esther_photo_one.jpg')
esther_lookbook_one.save
esther_lookbook_one.approve!

esther_lookbook_two = Lookbook.new(user: esther, title: 'Esther Second Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
esther_lookbook_two.product_ids = [1,2,3,4,5,6,7].sample(4)
esther_lookbook_image_two = File.join(Rails.root,'app/assets/images/esther_photo_two.jpg')
esther_lookbook_two.photo.attach(io: File.open(esther_lookbook_image_two) , filename: 'esther_photo_two.jpg')
esther_lookbook_two.save
esther_lookbook_two.approve!

esther_lookbook_three = Lookbook.new(user: esther, title: 'Esther Third Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
esther_lookbook_three.product_ids = [1,2,3,4,5,6,7].sample(4)
esther_lookbook_image_three = File.join(Rails.root,'app/assets/images/esther_photo_three.jpg')
esther_lookbook_three.photo.attach(io: File.open(esther_lookbook_image_three) , filename: 'esther_photo_three.jpg')
esther_lookbook_three.save
esther_lookbook_three.approve!

ropo_lookbook_one = Lookbook.new(user: ropo, title: 'Ropo First Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
ropo_lookbook_one.product_ids = [1,2,3,4,5,6,7].sample(4)
ropo_lookbook_image_one = File.join(Rails.root,'app/assets/images/ropo_photo_one.jpg')
ropo_lookbook_one.photo.attach(io: File.open(ropo_lookbook_image_one) , filename: 'ropo_photo_one.jpg')
ropo_lookbook_one.save
ropo_lookbook_one.approve!

ropo_lookbook_two = Lookbook.new(user: ropo, title: 'Ropo Second Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
ropo_lookbook_two.product_ids = [1,2,3,4,5,6,7].sample(4)
ropo_lookbook_image_two = File.join(Rails.root,'app/assets/images/ropo_photo_two.jpg')
ropo_lookbook_two.photo.attach(io: File.open(ropo_lookbook_image_two) , filename: 'ropo_photo_two.jpg')
ropo_lookbook_two.save
ropo_lookbook_two.approve!

ropo_lookbook_three = Lookbook.new(user: ropo, title: 'Ropo Third Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
ropo_lookbook_three.product_ids = [1,2,3,4,5,6,7].sample(4)
ropo_lookbook_image_three = File.join(Rails.root,'app/assets/images/ropo_photo_three.jpg')
ropo_lookbook_three.photo.attach(io: File.open(ropo_lookbook_image_three) , filename: 'ropo_photo_three.jpg')
ropo_lookbook_three.save
ropo_lookbook_three.approve!

breeny_lookbook_one = Lookbook.new(user: breeny, title: 'Breeny First Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
breeny_lookbook_one.product_ids = [1,2,3,4,5,6,7].sample(4)
breeny_lookbook_image_one = File.join(Rails.root,'app/assets/images/breeny_photo_one.jpg')
breeny_lookbook_one.photo.attach(io: File.open(breeny_lookbook_image_one) , filename: 'breeny_photo_one.jpg')
breeny_lookbook_one.save
breeny_lookbook_one.approve!

breeny_lookbook_two = Lookbook.new(user: breeny, title: 'Breeny Second Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
breeny_lookbook_two.product_ids = [1,2,3,4,5,6,7].sample(4)
breeny_lookbook_image_two = File.join(Rails.root,'app/assets/images/breeny_photo_two.jpg')
breeny_lookbook_two.photo.attach(io: File.open(breeny_lookbook_image_two) , filename: 'breeny_photo_two.jpg')
breeny_lookbook_two.save
breeny_lookbook_two.approve!

breeny_lookbook_three = Lookbook.new(user: breeny, title: 'Breeny Third Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
breeny_lookbook_three.product_ids = [1,2,3,4,5,6,7].sample(4)
breeny_lookbook_image_three = File.join(Rails.root,'app/assets/images/breeny_photo_three.jpg')
breeny_lookbook_three.photo.attach(io: File.open(breeny_lookbook_image_three) , filename: 'breeny_photo_three.jpg')
breeny_lookbook_three.save
breeny_lookbook_three.approve!

nikki_lookbook_one = Lookbook.new(user: nikki, title: 'Nikki First Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
nikki_lookbook_one.product_ids = [1,2,3,4,5,6,7].sample(4)
nikki_lookbook_image_one = File.join(Rails.root,'app/assets/images/nikki_photo_one.jpg')
nikki_lookbook_one.photo.attach(io: File.open(nikki_lookbook_image_one) , filename: 'nikki_photo_one.jpg')
nikki_lookbook_one.save
nikki_lookbook_one.approve!

nikki_lookbook_two = Lookbook.new(user: nikki, title: 'Nikki Second Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
nikki_lookbook_two.product_ids = [1,2,3,4,5,6,7].sample(4)
nikki_lookbook_image_two = File.join(Rails.root,'app/assets/images/nikki_photo_two.jpg')
nikki_lookbook_two.photo.attach(io: File.open(nikki_lookbook_image_two) , filename: 'nikki_photo_two.jpg')
nikki_lookbook_two.save
nikki_lookbook_two.approve!

nikki_lookbook_three = Lookbook.new(user: nikki, title: 'Nikki Third Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
nikki_lookbook_three.product_ids = [1,2,3,4,5,6,7].sample(4)
nikki_lookbook_image_three = File.join(Rails.root,'app/assets/images/nikki_photo_three.jpg')
nikki_lookbook_three.photo.attach(io: File.open(nikki_lookbook_image_three) , filename: 'nikki_photo_three.jpg')
nikki_lookbook_three.save
nikki_lookbook_three.approve!

shantania_lookbook_one = Lookbook.new(user: shantania, title: 'Shantania First Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
shantania_lookbook_one.product_ids = [1,2,3,4,5,6,7].sample(4)
shantania_lookbook_image_one = File.join(Rails.root,'app/assets/images/shantania_photo_one.jpg')
shantania_lookbook_one.photo.attach(io: File.open(shantania_lookbook_image_one) , filename: 'shantania_photo_one.jpg')
shantania_lookbook_one.save
shantania_lookbook_one.approve!

shantania_lookbook_two = Lookbook.new(user: shantania, title: 'Shantania Second Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
shantania_lookbook_two.product_ids = [1,2,3,4,5,6,7].sample(4)
shantania_lookbook_image_two = File.join(Rails.root,'app/assets/images/shantania_photo_two.jpg')
shantania_lookbook_two.photo.attach(io: File.open(shantania_lookbook_image_two) , filename: 'shantania_photo_two.jpg')
shantania_lookbook_two.save
shantania_lookbook_two.approve!

shantania_lookbook_three = Lookbook.new(user: shantania, title: 'Shantania Third Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
shantania_lookbook_three.product_ids = [1,2,3,4,5,6,7].sample(4)
shantania_lookbook_image_three = File.join(Rails.root,'app/assets/images/shantania_photo_three.jpg')
shantania_lookbook_three.photo.attach(io: File.open(shantania_lookbook_image_three) , filename: 'shantania_photo_three.jpg')
shantania_lookbook_three.save
shantania_lookbook_three.approve!

bemi_lookbook_one = Lookbook.new(user: bemi, title: 'Bemi First Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
bemi_lookbook_one.product_ids = [1,2,3,4,5,6,7].sample(4)
bemi_lookbook_image_one = File.join(Rails.root,'app/assets/images/bemi_photo_one.jpg')
bemi_lookbook_one.photo.attach(io: File.open(bemi_lookbook_image_one) , filename: 'bemi_photo_one.jpg')
bemi_lookbook_one.save
bemi_lookbook_one.approve!

bemi_lookbook_two = Lookbook.new(user: bemi, title: 'Bemi Second Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
bemi_lookbook_two.product_ids = [1,2,3,4,5,6,7].sample(4)
bemi_lookbook_image_two = File.join(Rails.root,'app/assets/images/bemi_photo_two.jpg')
bemi_lookbook_two.photo.attach(io: File.open(bemi_lookbook_image_two) , filename: 'bemi_photo_two.jpg')
bemi_lookbook_two.save
bemi_lookbook_two.approve!

bemi_lookbook_three = Lookbook.new(user: bemi, title: 'Bemi Third Lookbook', description: 'This is my everyday go to look. Go on, you know you want to add all products to your basket', status: 'approved')
bemi_lookbook_three.product_ids = [1,2,3,4,5,6,7].sample(4)
bemi_lookbook_image_three = File.join(Rails.root,'app/assets/images/bemi_photo_three.jpg')
bemi_lookbook_three.photo.attach(io: File.open(bemi_lookbook_image_three) , filename: 'bemi_photo_three.jpg')
bemi_lookbook_three.save
bemi_lookbook_three.approve!

puts "-"

# CREATING TUTORIAL PRODUCTS

puts "CREATING TUTORIAL PRODUCTS"

TutorialProduct.create!(
                        tutorial: esther_tutorial,
                        product: disco_fluid_lipstick
                        )

TutorialProduct.create!(
                        tutorial: esther_tutorial,
                        product: disco_topper_lip_topper
                        )

TutorialProduct.create!(
                        tutorial: esther_tutorial,
                        product: brow_lift
                        )

TutorialProduct.create!(
                        tutorial: esther_tutorial,
                        product: brow_filler
                        )

TutorialProduct.create!(
                        tutorial: breeny_tutorial,
                        product: disco_fluid_lipstick
                        )

TutorialProduct.create!(
                        tutorial: breeny_tutorial,
                        product: disco_topper_lip_topper
                        )

TutorialProduct.create!(
                        tutorial: breeny_tutorial,
                        product: brow_lift
                        )

TutorialProduct.create!(
                        tutorial: breeny_tutorial,
                        product: brow_filler
                        )

TutorialProduct.create!(
                        tutorial: nikki_tutorial,
                        product: disco_fluid_lipstick
                        )

TutorialProduct.create!(
                        tutorial: nikki_tutorial,
                        product: disco_topper_lip_topper
                        )

TutorialProduct.create!(
                        tutorial: nikki_tutorial,
                        product: brow_lift
                        )

TutorialProduct.create!(
                        tutorial: nikki_tutorial,
                        product: brow_filler
                        )

TutorialProduct.create!(
                        tutorial: shantania_tutorial,
                        product: disco_fluid_lipstick
                        )

TutorialProduct.create!(
                        tutorial: shantania_tutorial,
                        product: disco_topper_lip_topper
                        )

TutorialProduct.create!(
                        tutorial: shantania_tutorial,
                        product: brow_lift
                        )

TutorialProduct.create!(
                        tutorial: shantania_tutorial,
                        product: brow_filler
                        )

TutorialProduct.create!(
                        tutorial: bemi_tutorial,
                        product: disco_fluid_lipstick
                        )

TutorialProduct.create!(
                        tutorial: bemi_tutorial,
                        product: disco_topper_lip_topper
                        )

TutorialProduct.create!(
                        tutorial: bemi_tutorial,
                        product: brow_lift
                        )

TutorialProduct.create!(
                        tutorial: bemi_tutorial,
                        product: brow_filler
                        )

TutorialProduct.create!(
                        tutorial: ropo_tutorial,
                        product: disco_fluid_lipstick
                        )

TutorialProduct.create!(
                        tutorial: ropo_tutorial,
                        product: disco_topper_lip_topper
                        )

TutorialProduct.create!(
                        tutorial: ropo_tutorial,
                        product: brow_lift
                        )

TutorialProduct.create!(
                        tutorial: ropo_tutorial,
                        product: brow_filler
                        )

puts "-"

# CREATING CUSTOMER REVIEWS

puts "CREATING CUSTOMER REVIEWS"

reviews = ["This product works very well with my sking tone and I'm am very happy I tried it. Will definitely be buying this again",
          "I have this in the darkest shade which is my go-to on an everyday basis. It is beautiful, it makes an impact without looking glittery, chunky or unnatural.",
          "Bought this a few weeks ago and I have to say it is amazing. The colour is intense and very long lasting. I was so impressed by it, i’ve since purchased another shade.",
          "After using brow pencils for years, mainly for the brush side, this has been the best I've used so far!",
          "I was looking for a product to help with my eye lashes, because for some reason I was losing them. This product is great. My eye lashes are coming back."]


100.times do

CustomerReview.create!(
                      user: customers.sample,
                      rating: [3, 4, 5].sample,
                      product: Product.all.sample,
                      review: reviews.sample,
                      recommendation: ['Yes', 'Maybe'].sample
                      )

end

puts "-"

# CREATING INFLUENCER REVIEWS

puts "CREATING INSIDER REVIEWS"

30.times do

InsiderReview.create!(
                      user: insiders.sample,
                      rating: [3, 4, 5].sample,
                      product: Product.all.sample,
                      review: reviews.sample
                      )
end

puts "-"

# CREATING QUESTION ANSWERS

puts "CREATING Q&A FOR SHANTANIA BECKFORD & ROPO DEMURE"

shan_qa = QuestionAnswer.new(
                      user: shantania,
                      question_one: "How do you create a large social following while keeping it organic?",
                      question_two: "Are you seeing any popular requests recently?",
                      question_three: "Is being an influencer a full-time job or is it more of a hobby for you?",
                      question_four: "Who is taking your pictures? Friends or photographers? How long does it take you to publish your content?",
                      question_five: "How do you foster that sense of community with your social audience?",
                      question_six: "Any advice for a budding influencer?",
                      answer_one: "It’s really about engaging with my followers. I have certain followers who will comment on every single picture. I try to reply to them and really engage with them. It’s modern-day word-of-mouth. Also, hashtags have helped me a lot.",
                      answer_two: "All beauty. Lipsticks, eyeshadows, brushes. Makeup sales are at their highest levels ever. I think they want to keep that train going.",
                      answer_three: "It is a full-time passion! “Do something that you love, and you will never have to work a day in your life” No truer words were ever uttered. I love what I do and I am fulfilled because of all the challenges that I face and the rewards that come along with doing this efficiently and professionally.",
                      answer_four: "Currently I have a photographer taking my pictures but when I started, I had friends taking my pictures for me. I always try to publish to IG within a day of having received the completed pictures. I follow on from that with a full story on my blog a day or two later (for the latest)",
                      answer_five: "Social media is for building relationships and connecting with people. Personally, I try to respond to as many comments and replies on my posts as possible. Always look for ways to celebrate your customers. At our core, all we want is to know others and be known. If a brand can do that in a personal way, that’s awesome.",
                      answer_six: "Be authentic. Stay true to yourself and stay consistent. Once you give up, it’s over. I know girls who started blogs and then never went back to them. Even if you have to take a week off or a month off, try to still post pictures. Stay in your routine. I shoot every Saturday morning. But if I don’t shoot for a week I’ll prepare accordingly. Also, never take a brand deal that doesn’t make you happy. If you’re killing yourself over this and you’re unhappy, it’s not worth it.",
                      photo_one_alt_text: "shantania photo one",
                      photo_two_alt_text: "shantania photo two",
                      photo_three_alt_text: "shantania photo three",
)

shan_qa_photo_one = File.join(Rails.root,'app/assets/images/shan_qa_photo_one.jpg')
shan_qa.photo_one.attach(io: File.open(shan_qa_photo_one) , filename: 'shan_qa_photo_one.jpg')
shan_qa_photo_two = File.join(Rails.root,'app/assets/images/shan_qa_photo_two.jpg')
shan_qa.photo_two.attach(io: File.open(shan_qa_photo_two) , filename: 'shan_qa_photo_two.jpg')
shan_qa_photo_three = File.join(Rails.root,'app/assets/images/shan_qa_photo_three.jpg')
shan_qa.photo_three.attach(io: File.open(shan_qa_photo_three) , filename: 'shan_qa_photo_three.jpg')

shan_qa.save

ropo_qa = QuestionAnswer.new(
                      user: ropo,
                      question_one: "How did you get started in makeup?",
                      question_two: "What moment in your career are you most proud of?",
                      question_three: "If you weren't doing makeup, what would you be doing and why?",
                      question_four: "What does beauty mean to you?",
                      question_five: "Aside from a wallet and phone, what do you keep in your bag at all times?",
                      question_six: "What's your favorite product at the moment?",
                      answer_one: "My start in makeup came from my interest in magazine editorials. My mom worked in fashion, and when I would visit her office there were always the best European and fashion magazines sitting around. I would skim through them and was always inspired by the looks created on the pages. I would try to recreate the looks and practice on friends and family. I always knew I wanted to be a makeup artist.",
                      answer_two: "I was most proud of when MAC cosmetics hired me when I was 19 years old. I really wanted that job, and I admired how all the artists embodied what their brand stood for. I wanted to be part of the MAC culture so badly – and I felt that I accomplished that because of my persistence, not because of my prior experience. I consider MAC the start of my beauty career because I met so many industry veterans ever since.",
                      answer_three: "If I wasn’t a makeup artist and beauty blogger, I would be a photographer. As a child I always loved taking pictures of people and events. As a photographer, I loved capturing candid moments. I really thought I would be a photographer doing weddings and other specials occasions – but now I am doing the makeup for weddings!",
                      answer_four: "Beauty means happiness. When you are happy, there will always be beautiful energy around you, and you will always create your best work. It is important to remember the things that really matter in life, to be grateful and humble.",
                      answer_five: "I always have my lipstick with me. If my lipstick is faded, I feel like my look is incomplete – lipstick is life!",
                      answer_six: "My favorite product right now is my L’Oréal Paris Pro Glow Foundation. My skin is really dry, and it is the perfect texture and formula for my skin type. It gives me a glow without making me look oily. I recommended it to so many friends and now they are all wearing it!",
                      photo_one_alt_text: "Ropo Demure photo one",
                      photo_two_alt_text: "Ropo Demure photo two",
                      photo_three_alt_text: "Ropo Demure photo three",
)

ropo_qa_photo_one = File.join(Rails.root,'app/assets/images/ropo_qa_photo_one.jpg')
ropo_qa.photo_one.attach(io: File.open(ropo_qa_photo_one) , filename: 'ropo_qa_photo_one.jpg')
ropo_qa_photo_two = File.join(Rails.root,'app/assets/images/ropo_qa_photo_two.jpg')
ropo_qa.photo_two.attach(io: File.open(ropo_qa_photo_two) , filename: 'ropo_qa_photo_two.jpg')
ropo_qa_photo_three = File.join(Rails.root,'app/assets/images/ropo_qa_photo_three.jpg')
ropo_qa.photo_three.attach(io: File.open(ropo_qa_photo_three) , filename: 'ropo_qa_photo_three.jpg')

ropo_qa.save

# CREATING ORDERS AND ORDER PRODUCTS

# puts "Creating orders and order products"
# status = ["Processing", "Delivered", "Refunded", "Dispatched"]
# num = (2..7).to_a
# 5.times do
#   products = Product.all.sample(num.sample)
#   order = Order.create!(user: User.last, status: status.sample)
#   products.each do |product|
#     OrderProduct.create!(product: product, shade: product.shades.first, quantity: (1..2).to_a.sample, order: order)
#   end
# end

puts "-"

# CREATING EXCHANGE RATES

puts "CREATING EXCHANGE RATES"

ExchangeRate.create(
  currency: 'dollar',
  currency_code: 'usd',
  rate: 1.21
)

ExchangeRate.create(
  currency: 'euro',
  currency_code: 'eur',
  rate: 1.09
)

puts "-"

puts "***************"
puts "SEED COMPLETE"
puts "***************"



