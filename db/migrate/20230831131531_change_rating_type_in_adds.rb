class ChangeRatingTypeInAdds < ActiveRecord::Migration[7.0]
  def change
    change_column :adds, :rating, :float
  end
end
