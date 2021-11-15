class AddPhotoToToys < ActiveRecord::Migration[6.0]
  def change
    add_column :toys, :photo_url, :string
  end
end
