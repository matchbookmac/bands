class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates :name, {presence: true, uniqueness: {case_sensitive: false}}
  before_validation :titleize_name

  private
  def titleize_name
    self.name = Maybe(name).downcase
    self.name = Maybe(name).titleize
  end
end
