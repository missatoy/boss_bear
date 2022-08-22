class CreateBears < ActiveRecord::Migration[7.0]
  def change
    create_table :bears do |t|
      t.string :name
      t.string :personality
      t.text :description
      t.integer :price
      t.boolean :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
