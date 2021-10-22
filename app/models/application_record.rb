class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_save :clean_data

  def clean_data
    attributes.each{|key, value|value.try(:squish)}
  end
end
