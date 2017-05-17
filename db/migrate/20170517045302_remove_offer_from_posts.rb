class RemoveOfferFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :offer, :boolean
  end
end
