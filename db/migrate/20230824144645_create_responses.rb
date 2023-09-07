class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :consulting, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
