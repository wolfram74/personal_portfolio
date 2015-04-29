class CreateLocks < ActiveRecord::Migration
  def change
    create_table :locks do |t|
      t.text :property
      t.text :value
      t.timestamps
    end
  end
end
