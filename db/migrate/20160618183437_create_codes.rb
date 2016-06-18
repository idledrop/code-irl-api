class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.string :url
      t.integer :up
      t.integer :down

      t.timestamps
    end
  end
end
