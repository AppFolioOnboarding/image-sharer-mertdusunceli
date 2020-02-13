class Image < ApplicationRecord
  validates :image_url, presence: true, format: { with: %r{\A(http|https).*\.(png|jpg|jpeg)\z},
                                                  message: 'Invalid image URL' }
end
