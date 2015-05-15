class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates :name, {presence: true, uniqueness: {case_sensitive: false}}
  before_validation :titleize_venue

  private
  def titleize_venue
    self.name = Maybe(name).downcase
    self.name = Maybe(name).titleize
    self.location = Maybe(location).downcase
    self.location = Maybe(location).titleize
# binding.pry
  end
end
