class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates :name, {presence: true, uniqueness: {case_sensitive: false} }
  validates :location, {presence: true}
  before_validation :titleize_venue

  def unplayed_bands
    unplayed_bands = []
      Band.all.each do |band|
        unplayed_bands << band unless band.venues.include?(self)
      end
    unplayed_bands
  end

  private
  def titleize_venue
    name = Maybe(self.name).downcase
    self.name = name.titleize
    location = Maybe(self.location).downcase
    split_location = []
    split_location << location.split[0].titleize
    split_location << location.split[1].upcase
    self.location = split_location.join(' ')
  end
end
