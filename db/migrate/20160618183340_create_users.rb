class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :github
      t.string :password
      t.boolean :optin

      t.timestamps
    end
  end
end
