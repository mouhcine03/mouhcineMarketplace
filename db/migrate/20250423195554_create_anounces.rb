class CreateAnounces < ActiveRecord::Migration[7.1]
  def change
    create_table :anounces do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
