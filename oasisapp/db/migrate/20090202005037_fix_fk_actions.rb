class FixFkActions < ActiveRecord::Migration
  def self.up
  	execute "ALTER TABLE asessions DROP CONSTRAINT fk_asessions_to_admin;"
  	rename_column :actions, :asession_id, :admin_id
  	execute "ALTER TABLE actions ADD CONSTRAINT fk_actions_to_admin FOREIGN KEY (admin_id) REFERENCES admin (id);"
  end

  def self.down
  end
end
