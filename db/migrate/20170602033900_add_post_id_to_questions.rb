class AddPostIdToQuestions < ActiveRecord::Migration[5.0]
	def change
		unless column_exists? :questions, :post_id
			add_column :questions, :post_id, :integer
		end
	end
end
