class AddUserAndPlayerIdsToClubs < ActiveRecord::Migration
    def change
        add_column :clubs, :user_id, :integer
        add_column :clubs, :fwd_id, :integer
        add_column :clubs, :mid_id, :integer
        add_column :clubs, :def_id, :integer
        add_column :clubs, :gk_id, :integer
        add_column :clubs, :any_id, :integer
    end
end