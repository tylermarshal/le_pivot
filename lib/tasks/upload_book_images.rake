namespace :book_images do
  task :upload => [:environment] do
    Store.find_by(name: "Book Bar").items.each do |item|
      item.update({image: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'book_cover.png'))})
    end
  end
end
