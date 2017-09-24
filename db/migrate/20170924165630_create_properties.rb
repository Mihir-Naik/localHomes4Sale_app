class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :price
      t.string :address
      t.string :sq_footage
      t.integer :no_of_bedroom
      t.float :no_of_bathroom
      t.text :description
      t.string :image
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
