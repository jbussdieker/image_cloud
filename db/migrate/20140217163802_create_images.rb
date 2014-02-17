class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.datetime :taken_at
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
