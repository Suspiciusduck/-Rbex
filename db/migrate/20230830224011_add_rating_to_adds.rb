class AddRatingToAdds < ActiveRecord::Migration[7.0]
  def change
    add_column :adds, :rating, :integer
  end
end
