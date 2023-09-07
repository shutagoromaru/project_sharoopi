class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :url
      t.text :self_introduction
      t.text :special

      t.timestamps
    end
  end
end
