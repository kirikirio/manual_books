class CreateManuals < ActiveRecord::Migration[5.2]
  def change
    create_table :manuals do |t|
      t.string :name
      t.string :image
      t.string :category
      t.timestamps
    end
  end
end
