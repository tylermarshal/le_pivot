class ChangeTitleInItems < ActiveRecord::Migration[5.1]
  def change
    enable_extension("citext")
    change_column :items, :title, :citext
  end
end
