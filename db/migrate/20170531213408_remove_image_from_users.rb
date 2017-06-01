class RemoveImageFromUsers < ActiveRecord::Migration[5.0]
	def change
		if column_exists? :users, :image
			remove_column :users, :image
		end
	end
end
