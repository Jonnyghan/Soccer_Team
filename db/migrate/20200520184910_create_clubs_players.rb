class CreateClubsPlayers < ActiveRecord::Migration
  def change
    create_join_table :clubs,:players do |t|
      t.integer :club_id
      t.integer :player_id
    end
  end
end
