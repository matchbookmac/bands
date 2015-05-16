class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates :name, {presence: true, uniqueness: {case_sensitive: false}}
  before_validation :titleize_name

  def unplayed_venues
    unplayed_venues = []
    Venue.all.each do |venue|
binding.pry      
      unplayed_venues << venue unless venue.bands.include?(self)
    end
    unplayed_venues
  end

  private
  def titleize_name
    name = Maybe(self.name).downcase
    self.name = name.titleize
  end
end
