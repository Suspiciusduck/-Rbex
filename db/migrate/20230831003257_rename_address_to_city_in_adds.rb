class RenameAddressToCityInAdds < ActiveRecord::Migration[7.0]
  def change
    rename_column :adds, :address, :city
  end
end
