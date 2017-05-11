class AddFieldsToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :position, :string
  end
end
