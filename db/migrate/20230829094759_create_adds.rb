class CreateAdds < ActiveRecord::Migration[7.0]
  def change
    create_table :adds do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :availability
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
