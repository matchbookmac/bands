require 'maybe'

class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates :name, {presence: true, uniqueness: {case_sensitive: false}}
  before_validation :titleize_name

  private

  def titleize_name
    self.name = name.downcase.titleize
# binding.pry
  end
end
