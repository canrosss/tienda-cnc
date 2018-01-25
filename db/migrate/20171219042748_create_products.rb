class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.text :summary
      t.text :description
      t.text :body
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4

      t.timestamps
    end
  end
end
