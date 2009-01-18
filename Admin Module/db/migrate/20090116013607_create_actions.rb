class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
    	t.text :action, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :actions
  end
end
