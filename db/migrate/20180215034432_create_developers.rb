class CreateDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :developers do |t|
      t.references :user, foreign_key: true
      t.string :api_key

      t.timestamps
    end
  end
end
