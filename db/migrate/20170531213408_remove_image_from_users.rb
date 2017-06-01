class RemoveImageFromUsers < ActiveRecord::Migration[5.0]
	def change
		unless column_exists? :users, :image
			remove_column :users, :image
		end
	end
end
