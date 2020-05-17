class Club < ActiveRecord::Base
    has_many :players
    belongs_to :user
    validates_presence_of :user_id, :fwd_id, :mid_id, :def_id, :gk_id, :any_id
end
