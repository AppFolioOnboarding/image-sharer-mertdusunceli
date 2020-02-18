require 'test_helper'

VALID_URL ||= 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Lockheed_SR-71_Blackbird.jpg/1920px-Lockheed_SR-71_Blackbird.jpg'.freeze
INVALID_URL ||= 'https://www.google.com'.freeze
EMPTY_URL ||= ''.freeze

class ImageTest < ActiveSupport::TestCase
  test 'is valid image' do
    @image = Image.new(image_url: VALID_URL)
    assert_predicate @image, :valid?
  end

  test 'is image with empty url' do
    @image = Image.new(image_url: EMPTY_URL)
    assert_not_predicate @image, :valid?
  end

  test 'is image with invalid url' do
    @image = Image.new(image_url: INVALID_URL)
    assert_not_predicate @image, :valid?
  end

  test 'is image with valid url and tag list' do
    @image = Image.new(image_url: VALID_URL, tag_list: %w[skydiving paragliding])
    assert_predicate @image, :valid?
  end
end
