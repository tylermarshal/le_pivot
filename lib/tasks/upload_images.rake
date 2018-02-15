namespace :images do
  task :upload => [:environment] do
    Store.all.each do |store|
      if store.name == "Sacred Thistle"
        store.items.each do |item|
          item.update({image: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'default-succulent.jpeg'))})
        end
      elsif store.name == "Stone Leaf Pottery"
        store.items.each do |item|
          item.update({image: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'default-pot.jpeg'))})
        end
      elsif store.name == "Creative Living Decor"
        store.items.each do |item|
          item.update({image: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'default-decor.jpeg'))})
        end
      elsif store.name == "Aroma Candles"
        store.items.each do |item|
          item.update({image: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'default-candles.jpeg'))})
        end
      elsif store.name == "Lather Soap"
        store.items.each do |item|
          item.update({image: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'default-soap.jpg'))})
        end
      end
    end
  end
end
