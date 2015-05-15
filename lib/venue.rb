class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates :name, {presence: true, uniqueness: {case_sensitive: false}}
end
