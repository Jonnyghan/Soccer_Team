class RemoveCityAndAbbreviationFromClubs < ActiveRecord::Migration
    def change
        remove_column :clubs, :city, :string
        remove_column :clubs, :abbreviation, :string
    end
end
