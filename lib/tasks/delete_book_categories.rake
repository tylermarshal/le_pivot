namespace :book_categories do
  task :delete => [:environment] do
    CATEGORIES = ["Suspense", "Thriller", "Western", "Crime", "Horror", "Fantasy", "Mystery", "Science Fiction"]
    CATEGORIES.each do |category|
      Category.find_by(title: category).destroy
      puts "deleted #{category}"
    end
  end
end
