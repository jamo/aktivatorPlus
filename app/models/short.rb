class Short < ActiveRecord::Base
  validates :ure, :presence => true
  validates :shortened, :presence => true
  validates_format_of :uri, :with => URI::regexp(%w(http https))
end
