require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get offers" do
    post :offers, query: {uid: 'player1', pub0: 'campaign2', page: '1'}
    assert_template 'offers'
    assert_template '_offer'
  end

  test "should get error" do
    post :offers, query: {uid: 'player2', pub0: 'campaign2', page: '2'}
    assert_template 'offers'
    assert_template '_error'
  end

end
