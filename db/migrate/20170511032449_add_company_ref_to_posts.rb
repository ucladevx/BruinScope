class AddCompanyRefToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :company, foreign_key: true
  end
end
