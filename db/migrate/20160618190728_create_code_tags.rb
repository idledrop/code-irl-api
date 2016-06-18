class CreateCodeTags < ActiveRecord::Migration[5.0]
  def change
    create_table :code_tags do |t|
      t.references :code, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
