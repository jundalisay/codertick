class Venue < ActiveRecord::Base
  belongs_to :region
  validates_uniqueness_of :name
  has_many :events

end
