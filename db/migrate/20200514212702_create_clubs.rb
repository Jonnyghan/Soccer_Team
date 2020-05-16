class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :city
      t.string :abbreviation     
    end
  end
end
