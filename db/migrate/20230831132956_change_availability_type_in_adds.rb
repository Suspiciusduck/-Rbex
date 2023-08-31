class ChangeAvailabilityTypeInAdds < ActiveRecord::Migration[7.0]
  def change
    change_column :adds, :availability, :string
  end
end
