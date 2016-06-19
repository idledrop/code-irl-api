class CreateHangouts < ActiveRecord::Migration[5.0]
  def change
    create_table :hangouts do |t|
      t.references :code, foreign_key: true

      t.timestamps
    end
  end
end
