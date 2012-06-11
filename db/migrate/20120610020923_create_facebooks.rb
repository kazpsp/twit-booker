class CreateFacebooks < ActiveRecord::Migration
  def change
    create_table :facebooks do |t|
      t.string :email
      t.string :nombre
      t.integer :fbid

      t.timestamps
    end
  end
end
  