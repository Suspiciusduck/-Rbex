class AddDescriptionToAdds < ActiveRecord::Migration[7.0]
  def change
    add_column :adds, :description, :string
  end
end
