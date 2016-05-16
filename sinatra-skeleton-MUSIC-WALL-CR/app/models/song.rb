require 'uri' #for the url validation

class Song < ActiveRecord::Base

  validates :title, presence: true, length: {minimum: 2}
  validates :artist, presence: true, length: {minimum: 2, maximum: 25}
   validates_each :url, :allow_blank => true do |record, field, value|
    begin
      valid = (URI.parse(value).scheme =~ /https?/)
    rescue URI::InvalidURIError
      valid = false
    end
    record.errors.add field, "not a valid url" unless valid
  end
end