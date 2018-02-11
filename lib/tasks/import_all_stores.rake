namespace :import_all_stores do
  task :create => [:environment] do

    STORES = ["Sacred Thistle", "Stone Leaf Pottery", "Creative Living Decor", "Aroma Candles", "Lather Soap"]
    STORES.each do |name|
      store = Store.create(name: name)
      if name == "Sacred Thistle"
        category = Category.create(title: "plants")
        Item.create(title: "Haworthia Fasciata", description: "A beautiful plant, rare in culvitation. A wonderful addition to any home.", price: 14.99, image_file_name: "default-succulent.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Echeveria", description: "A common, yet beautiful succulent that turns a frosty purple color in the winter.", price: 12.99, image_file_name: "default-succulent.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Viper's Bowstring Hemp", description: "Sansevieria trifasciata is a species of flowering plant in the family Asparagaceae, native to tropical West Africa from Nigeria east to the Congo.", price: 12.99, image_file_name: "default-succulent.jpeg", image_content_type: "image/jpeg", store: store, category: category)
      elsif name == "Stone Leaf Pottery"
        category = Category.create(title: "ceramics")
        Item.create(title: "Clay Pot 10 Inches", description: "High quality terracotta,High fired, Smooth texture", price: 10.99, image_file_name: "default-pot.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Champoli Glazed Ceramic Pot", description: "High quality terracotta,High fired, Smooth texture", price: 17.99, image_file_name: "default-pot.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: 'Bloem Terra Two-Tone Saucer, 12"', description: "The polished colorful rims on pot and saucer are removeable giving you a 2 in 1 versatile look each season.", price: 11.99, image_file_name: "default-pot.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Country Rustic Ceramic Succulent Planters", description: "Bring country rustic flair to your home by displaying your potted plants in this ceramic planter pot and display tray set.", price: 26.99, image_file_name: "default-pot.jpeg", image_content_type: "image/jpeg", store: store, category: category)
      elsif name == "Creative Living Decor"
        category = Category.create(title: "decor")
        Item.create(title: "Greenco 5 Tier Wall Mount Corner Shelves", description: "5 tier wall mount corner shelves Made of durable MDF laminate.", price: 37.99, image_file_name: "default-decor.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Gold Geometric Boho LED Bedroom Fairy Lights", description: "10-Light (Warm White / Yellow) strand is approximately 5 ft, Lighted length is 4 ft", price: 17.99, image_file_name: "default-decor.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Large Hippie Mandala Floor Pillow", description: "Fabric: 100% Cotton Fabric, Screen Printed Design.", price: 11.99, image_file_name: "default-decor.jpeg", image_content_type: "image/jpeg", store: store, category: category)
      elsif name == "Aroma Candles"
        category = Category.create(title: "candles")
        Item.create(title: "Chesapeake Bay Candle", description: "The soft colored frosted jar candles allow the light of the flame to shine through when burning.", price: 13.99, image_file_name: "default-candles.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Set of 6 Scented Candles", description: "Updated luxury candle votive set includes six Fragrances : Orchid, Rose, Lotus, Lilac, Gardenia & lavender.", price: 24.95, image_file_name: "default-candles.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Bolsius 3x6 Set Of 6 Ivory Pillar Candles", description: "Bolsius Tray Of 6 ivory Pillar Candles Aprox 3X6 inches", price: 35.95, image_file_name: "default-candles.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Aspen Bay Jar Volcano Candle", description: "Capri Blue fragrances blend exotic essential and fragrance oils for a unique olfactory experience!", price: 24.36, image_file_name: "default-candles.jpeg", image_content_type: "image/jpeg", store: store, category: category)
      elsif name == "Lather Soap"
        category = Category.create(title: "soap")
        Item.create(title: "Naturally Moisturizing Bath Soap", description: "Experience these lovely scents and rich lather for a truly delightful shower", price: 14.99, image_file_name: "default-soap.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Bali Soap", description: "An exotic blend of organic ingredients which results in an invigorating exfoliating scrub combined with a creamy lather", price: 14.99, image_file_name: "default-soap.jpeg", image_content_type: "image/jpeg", store: store, category: category)
        Item.create(title: "Sappo Hill Soap", description: "Sappo Hill Soap, Bar Soap, Aloe Oatmeal, 3.5 oz", price: 29.99, image_file_name: "default-soap.jpeg", image_content_type: "image/jpeg", store: store, category: category)
      end
    end
  end
end
