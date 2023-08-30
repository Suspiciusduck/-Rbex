class AddCityToAdds < ActiveRecord::Migration[7.0]
  def change
    add_column :adds, :city, :string
  end
end
