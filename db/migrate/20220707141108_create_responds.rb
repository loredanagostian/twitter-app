class CreateResponds < ActiveRecord::Migration[7.0]
  def change
    create_table :responds do |t|
      t.text :content, null: false
      t.references :comment, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
