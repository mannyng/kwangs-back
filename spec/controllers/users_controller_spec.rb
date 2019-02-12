require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  def test_index
    get :index
    assert_equal User.all, assigns(:users)
  end
  
end
