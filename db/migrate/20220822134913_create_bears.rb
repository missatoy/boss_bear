class CreateBears < ActiveRecord::Migration[7.0]
  def change
    create_table :bears do |t|
      t.string :photo
      t.string :name
      t.string :personality
      t.text :description
      t.integer :price
      t.boolean :status
      t.integer :user_id

      t.timestamps
    end
  end
end
