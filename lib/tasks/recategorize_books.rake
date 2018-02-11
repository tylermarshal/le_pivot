namespace :recategorize_books do
  task :run => [:environment] do
    store = Store.find_by(name: "Book Bar")
    category = Category.create(title: "books")
    store.items.each do |item|
      item.update(category: category)
    end
  end
end
