class Image < ApplicationRecord
  acts_as_taggable_on :tags
  validates :image_url, presence: true, format: { with: %r{\A(http|https).*\.(png|jpg|jpeg)\z},
                                                  message: 'Invalid image URL' }
end
