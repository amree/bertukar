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
    fill_in 'Email', with: 'aurorius@gmail.com'
    fill_in 'Kata Laluan', with: 'aurorius@gmail.com'
    click_button 'Login'

    debugger

    # assert page.has_content? 'Signed in successfully.'
    assert page.has_content?('Invalid email or password.')
  end
end
