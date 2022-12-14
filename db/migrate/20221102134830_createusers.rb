class Createusers < ActiveRecord::Migration[7.0]
 def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :email
      t.integer :age
      t.belongs_to :city, index: true
      t.timestamps
      has_secure_password
    end
  end
end
