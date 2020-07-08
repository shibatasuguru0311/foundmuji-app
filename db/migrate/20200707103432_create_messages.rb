class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :shop, foreign_key: true
      t.references :item, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
