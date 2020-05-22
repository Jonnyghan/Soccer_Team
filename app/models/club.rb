class Club < ActiveRecord::Base
    belongs_to :user
    has_and_belongs_to_many :players
    validates_presence_of :user_id,:name
    validates_uniqueness_of :name
end
