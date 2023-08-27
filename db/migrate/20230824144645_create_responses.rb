class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
