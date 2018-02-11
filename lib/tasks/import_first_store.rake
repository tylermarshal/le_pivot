namespace :import_first_store do
  task :create => [:environment] do
    store1 = Store.create(name: "Book Bar")
    Item.all.each do |item|
      item.update(store_id: store1.id)
    end
  end
end
