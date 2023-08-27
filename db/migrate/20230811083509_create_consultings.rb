class CreateConsultings < ActiveRecord::Migration[7.0]
  def change
    create_table :consultings do |t|
      t.integer :user_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
