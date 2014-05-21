class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
