class CreateUrls < ActiveRecord::Migration
  def self.up
    create_table :urls do |t|
      t.string :full
      t.string :short
      t.integer :user_id
      t.string :title
      t.integer :count
      t.date :last

      t.timestamps
    end
     add_index :urls, :short, :unique => true
  end

  def self.down
    drop_table :urls
  end
end
