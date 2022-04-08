class AddUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      #id -> se genereaza automat

      #nume
      t.string :name

      #mail
      t.string :email

      #varsta
      t.integer :age
    end
  end
end

