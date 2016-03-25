class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types
  has_many :orders #jun added
  has_many :venues #jun added
  has_many :categories #jun added

  # accepts_nested_attributes_for :venues #jun added
  # accepts_nested_attributes_for :categories #jun added

  validates_presence_of :extended_html_description, :venue_id, :category_id, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue_id, :starts_at]}

end