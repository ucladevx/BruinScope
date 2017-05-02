class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :location
      t.string :link
      t.text :description
			t.string :image

      t.timestamps
    end
  end
end
