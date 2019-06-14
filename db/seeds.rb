# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Department.destroy_all
Brand.destroy_all
Category.destroy_all
SubCategory.destroy_all
Shade.destroy_all
ProductBenefit.destroy_all
Benefit.destroy_all
RecommendedProduct.destroy_all
Product.destroy_all
User.destroy_all
# CREATING DEPARTMENTS

makeup = Department.create!(name: "Makeup")

# CREATING BRANDS

black_opal = Brand.create!(name: "Black Opal", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")
juvias_place = Brand.create!(name: "Juvia's Place", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")
beauty_edit_mayfair = Brand.create!(name: "Beauty Edit Mayfair", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")
makeup_54 = Brand.create!(name: "Makeup 54", description: "MAKEUP54 embodies the glittering glamour of the seventies and eighties decades. Paying tribute to the iconic figures who seized the style of the era, MAKEUP54 celebrates idols who reflect the age and the decadence of discotheques they danced in. MAKEUP54 captures the escapism of its eras, campaigns for colour and is makeup styled to BE SEEN in.")
sacha_cosmetics = Brand.create!(name: "Sacha Cosmetics", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")
black_up = Brand.create!(name: "Black Up", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")
mdm_flow = Brand.create!(name: "MDM Flow", description: "Beauty Edit Mayfair is the brainchild of celebrity brow expert, Sherrille Riley – a stand out range of brow enhancing pencils, brushes and a setting gel. The inclusive collection is expertly created, bringing Riley’s in-salon expertise to clients helping them maintain and create expert results at home.")

mp = File.join(Rails.root,'app/assets/images/makeup_54_logo.png')
bp = File.join(Rails.root,'app/assets/images/beauty_edit_mayfair_logo.png')
makeup_54.photo.attach(io: File.open(mp) , filename: 'makeup_54_logo.png')
beauty_edit_mayfair.photo.attach(io: File.open(bp), filename: 'beauty_edit_mayfair_logo.png')
makeup_54.logo.attach(io: File.open(mp) , filename: 'makeup_54_logo.png')
beauty_edit_mayfair.logo.attach(io: File.open(bp), filename: 'beauty_edit_mayfair_logo.png')
# CREATING CATEGORIES

face = Category.create!(name: "Face")
tools = Category.create!(name: "Tools")
lips = Category.create!(name: "Lips")
eyes = Category.create!(name: "Eyes")
gifts_sets = Category.create!(name: "Gift Sets")

# CREATING SUB_CATEGORIES

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

# CREATING BENEFITS

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

# CREATING PRODUCTS FOR MAKEUP 54


# DISCO FLUID LIPSTICK
disco_fluid_lipstick = Product.create!(measurement: "grams", title: "Disco Fluid Lipstick", lb_id: "LB00001", department: makeup, category: lips, sub_category: lipstick, brand: makeup_54, weight: 53, price_cents: 1700, details: "Take your lips to the dancefloor for velvet smooth, kissable lips that will last all night long.
This unique texture changes continuously, creamy and enveloping in application, it transforms itself from velvety to absolute matte for impeccable perfection. A special mix of emollient oils give a creamy texture and smooth finish, with a silky touch. Optimal hold and no transfer for impeccable colour that lasts over time.")

red_jerry = Shade.create!(name: "Red - Jerry", sku: "M5400001", product: disco_fluid_lipstick)
pink_ross = Shade.create!(name: "Pink - Ross", sku: "M5400002", product: disco_fluid_lipstick)
nude_gaynor = Shade.create!(name: "Nude - Gaynor", sku: "M5400004", product: disco_fluid_lipstick)

rj1 = File.join(Rails.root,'app/assets/images/red_jerry1.jpg')
red_jerry.photos.attach(io: File.open(rj1) , filename: 'red_jerry1.jpg')

rj2 = File.join(Rails.root,'app/assets/images/red_jerry2.jpg')
red_jerry.photos.attach(io: File.open(rj2) , filename: 'red_jerry2.jpg')

rj3 = File.join(Rails.root,'app/assets/images/red_jerry3.jpg')
red_jerry.photos.attach(io: File.open(rj3) , filename: 'red_jerry3.jpg')

rj4 = File.join(Rails.root,'app/assets/images/red_jerry4.png')
red_jerry.photos.attach(io: File.open(rj4) , filename: 'red_jerry4.png')

pink_ross1 = File.join(Rails.root,'app/assets/images/pink_ross1.jpg')
pink_ross.photos.attach(io: File.open(pink_ross1) , filename: 'pink_ross1.jpg')

pink_ross2 = File.join(Rails.root,'app/assets/images/pink_ross2.jpg')
pink_ross.photos.attach(io: File.open(pink_ross2) , filename: 'pink_ross2.jpg')

pink_ross3 = File.join(Rails.root,'app/assets/images/pink_ross3.jpg')
pink_ross.photos.attach(io: File.open(pink_ross3) , filename: 'pink_ross3.jpg')

pink_ross4 = File.join(Rails.root,'app/assets/images/pink_ross4.png')
pink_ross.photos.attach(io: File.open(pink_ross4) , filename: 'pink_ross4.png')

nude_gaynor1 = File.join(Rails.root,'app/assets/images/nude_gaynor1.jpg')
nude_gaynor.photos.attach(io: File.open(nude_gaynor1) , filename: 'nude_gaynor1.jpg')

nude_gaynor2 = File.join(Rails.root,'app/assets/images/nude_gaynor2.jpg')
nude_gaynor.photos.attach(io: File.open(nude_gaynor2) , filename: 'nude_gaynor2.jpg')

nude_gaynor3 = File.join(Rails.root,'app/assets/images/nude_gaynor3.png')
nude_gaynor.photos.attach(io: File.open(nude_gaynor3) , filename: 'nude_gaynor3.png')

nude_gaynor4 = File.join(Rails.root,'app/assets/images/nude_gaynor4.jpg')
nude_gaynor.photos.attach(io: File.open(nude_gaynor4) , filename: 'nude_gaynor4.jpg')

v_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: vegan)
long_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: longwearing)
build_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: buildable_coverage)
transfer_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: transfer_resistant)
creamy_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: creamy_fluid_formula)
non_dry_disco_fluid = ProductBenefit.create!(product: disco_fluid_lipstick, benefit: non_drying)






# DISCO TOPPER

disco_topper_lip_topper = Product.create!(measurement: "grams", title: "Disco Topper Lip Topper", lb_id: "LB0002", department: makeup, category: lips, sub_category: lipstick, brand: makeup_54, weight: 53, price_cents: 1800, details: "The only accessory to be seen with on the dancefloor. Transform your lips before you hit the dancefloor and see the stars from the sky light up your lips with one swipe of this dazzling glitter topcoat. A special water infused gel texture, with moonstone extract gives a multidimensional, glittered effect when applied on lips. Once set it gives a long, locked in finish. Use with your favourite Makeup54 disco lipstick for the ultimate lip colour that is sure to get you seen.")

glitterball = Shade.create!(name: "Glitterball", sku: "M5400005", product: disco_topper_lip_topper)

glitterball1 = File.join(Rails.root,'app/assets/images/glitterball1.jpg')
glitterball.photos.attach(io: File.open(glitterball1) , filename: 'glitterball1.jpg')

glitterball2 = File.join(Rails.root,'app/assets/images/glitterball2.jpg')
glitterball.photos.attach(io: File.open(glitterball2) , filename: 'glitterball2.jpg')

glitterball3 = File.join(Rails.root,'app/assets/images/glitterball3.jpg')
glitterball.photos.attach(io: File.open(glitterball3) , filename: 'glitterball3.jpg')

glitterball4 = File.join(Rails.root,'app/assets/images/glitterball4.png')
glitterball.photos.attach(io: File.open(glitterball4) , filename: 'glitterball4.png')


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
  category: eyes,
  sub_category: brow,
  brand: beauty_edit_mayfair,
  weight: 1.41,
  price_cents: 2400,
  details: "Achieve an instant eye lift.
This lightweight, silky highlighter defines brows with a matte finish to raise and accentuate the brow bone. Its creamy formula means it is applied easily to achieve a softly defined finish. This pencil, formulated with dry emollients, is also an effective concealer, disguising eyebrow tattoos or imperfections."
)

pick_me_up = Shade.create!(name: "Pick-Me-Up", sku: "BL03", product: brow_lift)

pick_me_up1 = File.join(Rails.root,'app/assets/images/pick_me_up1.png')
pick_me_up.photos.attach(io: File.open(pick_me_up1) , filename: 'pick_me_up1.png')

pick_me_up2 = File.join(Rails.root,'app/assets/images/pick_me_up2.tif')
pick_me_up.photos.attach(io: File.open(pick_me_up2) , filename: 'pick_me_up2.tif')

pick_me_up3 = File.join(Rails.root,'app/assets/images/pick_me_up3.png')
pick_me_up.photos.attach(io: File.open(pick_me_up3) , filename: 'pick_me_up3.png')

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
  details: "Essential for brow beauty.
This creates beautifully defined brows with a non-waxy finish. The intensely pigmented lead delivers a precise line and perfectly mimics brow hairs. It lasts up to 12 hours.")

dark_dahlia = Shade.create!(name: "Dark Dahlia", sku: "BF03", product: brow_filler)

dark_dahlia1 = File.join(Rails.root,'app/assets/images/dark_dahlia1.png')
dark_dahlia.photos.attach(io: File.open(dark_dahlia1) , filename: 'dark_dahlia1.png')

dark_dahlia2 = File.join(Rails.root,'app/assets/images/dark_dahlia2.tif')
dark_dahlia.photos.attach(io: File.open(dark_dahlia2) , filename: 'dark_dahlia2.tif')

dark_dahlia3 = File.join(Rails.root,'app/assets/images/dark_dahlia3.png')
dark_dahlia.photos.attach(io: File.open(dark_dahlia3) , filename: 'dark_dahlia3.png')

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
  price_cents: 2500,
  details: "Sets, defines and holds.
A clear brow gel that sets and holds brows and can be worn alone or with an eyebrow pencil. There is no product build-up, and the gel contains vitamins B5 and E as well as castor oil to strengthen and condition hair brows."
)

clear = Shade.create!(name: "Clear", sku: "BR01", product: brow_setter)

clear1 = File.join(Rails.root,'app/assets/images/clear1.png')
clear.photos.attach(io: File.open(clear1) , filename: 'clear1.png')

clear2 = File.join(Rails.root,'app/assets/images/clear2.png')
clear.photos.attach(io: File.open(clear2) , filename: 'clear2.png')

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
  details: "A multi-tasking brow brush.
This nifty-sized spoolie brush is the perfect brow styling tool which also tames the brows while distributing brow pencil evenly to achieve a natural look."
)

brush = Shade.create!(name: "", sku: "BS01", product: brow_styler)

brush1 = File.join(Rails.root,'app/assets/images/brush1.png')
brush.photos.attach(io: File.open(brush1) , filename: 'brush1.png')

brush2 = File.join(Rails.root,'app/assets/images/brush2.png')
brush.photos.attach(io: File.open(brush2) , filename: 'brush2.png')

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
  details: "Ensures perfect precision.
This brush effortlessly blends a brow highlighter pencil which helps to define the brow bone and create a sought-after shape. It is also handy for applying concealer on delicate areas."
)

highlighter_brush_shade = Shade.create!(name: "", sku: "HB01", product: highlighter_brush)

highlighter_brush1 = File.join(Rails.root,'app/assets/images/highlighter_brush1.png')
highlighter_brush_shade.photos.attach(io: File.open(highlighter_brush1) , filename: 'highlighter_brush1.png')

highlighter_brush2 = File.join(Rails.root,'app/assets/images/highlighter_brush2.png')
highlighter_brush_shade.photos.attach(io: File.open(highlighter_brush2) , filename: 'brush2.png')

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


# CREATING INFLUENCERS
puts "Creating users"


esther = User.create!(influencer: true, first_name: "Esther", last_name: "Areola", instagram: "@esaregrams", password: "esther123", email: "esther@estareonline.com")
ropo = User.create!(influencer: true, first_name: "Ropo", last_name: "Demure", instagram: "@ropo.demure", password: "ropo123", email: "ropo_demuren@gmail.com")
breen = User.create!(influencer: true, first_name: "Breeny", last_name: "Lee", instagram: "@breenlee", password: "breeny123", email: "info.breenylee@gmail.com")
nikki = User.create!(influencer: true, first_name: "Nikki", last_name: "Patel", instagram: "@nikissecretx", password: "nikki123", email: "nicky.o.patel@gmail.com")
shantania = User.create!(influencer: true, first_name: "Shantania", last_name: "Beckford", instagram: "@shantaniabeckford", password: "shantania123", email: "shantaniabeckford@gmail.com")
bemi = User.create!(influencer: true, first_name: "Bemi", last_name: "Akinde", instagram: "@beautybybemii", password: "bemi123", email: "beautybybemi@gmail.com")

esther_cover = File.join(Rails.root,'app/assets/images/esther_cover.jpeg')
esther.cover_photo.attach(io: File.open(esther_cover) , filename: 'esther_cover.jpeg')

esther_avatar = File.join(Rails.root,'app/assets/images/esther_avatar.jpeg')
esther.avatar_photo.attach(io: File.open(esther_avatar) , filename: 'esther_avatar.jpeg')

ropo_cover = File.join(Rails.root,'app/assets/images/ropo_cover.jpeg')
ropo.cover_photo.attach(io: File.open(ropo_cover) , filename: 'ropo_cover.jpeg')

ropo_avatar = File.join(Rails.root,'app/assets/images/ropo_avatar.jpeg')
ropo.avatar_photo.attach(io: File.open(ropo_avatar) , filename: 'ropo_avatar.jpeg')


nikki_cover = File.join(Rails.root,'app/assets/images/nikki_cover.jpeg')
nikki.cover_photo.attach(io: File.open(nikki_cover) , filename: 'nikki_cover.jpeg')

nikki_avatar = File.join(Rails.root,'app/assets/images/nikki_avatar.jpeg')
nikki.avatar_photo.attach(io: File.open(nikki_avatar) , filename: 'nikki_avatar.jpeg')


shatania_cover = File.join(Rails.root,'app/assets/images/shatania_cover.jpeg')
shantania.cover_photo.attach(io: File.open(shatania_cover) , filename: 'shatania_cover.jpeg')

shatania_avatar = File.join(Rails.root,'app/assets/images/shatania_avatar.jpeg')
shantania.avatar_photo.attach(io: File.open(shatania_avatar) , filename: 'shatania_avatar.jpeg')

bemi_cover = File.join(Rails.root,'app/assets/images/bemi_cover.jpeg')
bemi.cover_photo.attach(io: File.open(bemi_cover) , filename: 'bemi_cover.jpeg')

bemi_avatar = File.join(Rails.root,'app/assets/images/bemi_avatar.jpeg')
bemi.avatar_photo.attach(io: File.open(bemi_avatar) , filename: 'bemi_avatar.jpeg')











