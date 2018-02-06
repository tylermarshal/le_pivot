# namespace :import_store do
#   task :create_store => [:environment] do
#     store1 = Store.create(name: "Book Bar")
#     Item.all.each do |item|
#       item.update(store_id: store1.id)
#     end
#   end
# end
