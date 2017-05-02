class AddDetailsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :offer, :boolean
    add_column :posts, :resources, :text
  end
end
