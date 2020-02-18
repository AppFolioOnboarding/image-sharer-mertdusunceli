require 'test_helper'

VALID_URL ||= 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Lockheed_SR-71_Blackbird.jpg/1920px-Lockheed_SR-71_Blackbird.jpg'.freeze

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index page' do
    get images_path
    assert_response :ok
    assert_select 'a', 'Add Image'
  end

  test 'should get new image page' do
    get new_image_path
    assert_response :ok
  end

  test 'should create image (no tags) and redirect' do
    assert_difference('Image.count') do
      post '/images', params: { image: { image_url: VALID_URL } }
    end
    assert_response :redirect
    assert_redirected_to image_path(Image.last)
    assert_includes Image.last.image_url, VALID_URL
  end

  test 'should not create image with invalid url' do
    assert_no_difference('Image.count') do
      post '/images', params: { image: { image_url: ' ' } }
    end
    assert_response :ok
  end

  test 'should show an image' do
    Image.create!(image_url: VALID_URL)
    get image_path(Image.last)
    assert_response :ok
    assert_includes response.body, VALID_URL
    assert_equal Image.last.image_url, VALID_URL
  end
end
