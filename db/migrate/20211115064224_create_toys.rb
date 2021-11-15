class CreateToys < ActiveRecord::Migration[6.0]
  def change
    create_table :toys do |t|
      t.string :name
      t.string :category
      t.date :dates_available
      t.integer :price
      t.string :description
      t.integer :condition
      t.boolean :availability, default: true
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
