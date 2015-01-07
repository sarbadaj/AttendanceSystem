require 'spec_helper'
feature "add", :js => true do
  scenario "specific user" do
    visit '/'
    click_link 'Sign up'
    fill_in 'company_name', :with => "Jyaasa"
    fill_in 'Email', :with => "sarbada@Jyaasa.com"
    fill_in 'Password', :with => "12345678"
    fill_in 'Password confirmation', :with => '12345678'
    click_button 'Sign up'
    fill_in 'Email', :with => "sarbada@Jyaasa.com"
    fill_in 'Password', :with => "12345678"
    click_button 'Log in'
    page.should have_content "Signed in successfully"
    click_link 'Login'
    page.should have_content "Wish you a great day. Thank you for your login"
    click_link 'Logout'
    page.should have_content "Thank you for your logout"
    click_link 'Login'
    page.should have_content "You have been already login for today"
  end

end