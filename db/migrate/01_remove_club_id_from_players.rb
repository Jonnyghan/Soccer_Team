class RemoveClubIdFromPlayers < ActiveRecord::Migration
    def change 
        remove_column :players, :club_id, :integer
    end
end
