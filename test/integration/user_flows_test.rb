require 'test_helper'

# include Warden::Test::Helpers
# Warden.test_mode!

class UserFlowsTest < ActionDispatch::IntegrationTest
  # setup do
  #   user = users(:user)
  #   login_as user, :scope => :user, :run_callbacks => false
  # end

  test "Login and browse site" do
    visit '/users/sign_in'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Kata Laluan', with: 'password'
    click_button 'Login'

    assert page.has_content? 'Signed in successfully.'
  end
end
