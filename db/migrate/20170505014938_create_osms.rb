class CreateOsms < ActiveRecord::Migration
  def change
    create_table :osms do |t|
      t.text :custom01
      t.text :custom02
      t.text :custom03
      t.string :custom04
      t.string :custom05
      t.string :custom06

      t.timestamps null: false
    end
  end
end
