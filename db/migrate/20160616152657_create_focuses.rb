class CreateFocuses < ActiveRecord::Migration[5.0]
  def change
    create_table :focuses do |t|
      t.string :name
      t.string :shortname

      t.timestamps
    end
  end
end
