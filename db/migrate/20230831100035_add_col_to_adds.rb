class AddColToAdds < ActiveRecord::Migration[7.0]
  def change
    add_column :adds, :latitude, :float
    add_column :adds, :longitude, :float
  end
end
