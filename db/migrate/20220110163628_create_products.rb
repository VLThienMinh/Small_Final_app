class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.integer :old_price
      t.integer :new_price

      t.belongs_to :category, foreign_key: true
      t.timestamps
    end
  end
end
