class AddTitleToResponses < ActiveRecord::Migration[7.0]
  def change
    add_column :responses, :title, :string
  end
end
