class RemovePlayerIdsFromClubs < ActiveRecord::Migration

    def change
        remove_column :clubs, :fwd_id, :integer
        remove_column :clubs, :mid_id, :integer
        remove_column :clubs, :def_id, :integer
        remove_column :clubs, :gk_id, :integer
        remove_column :clubs, :any_id, :integer
    end

end
