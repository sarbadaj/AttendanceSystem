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
    visit '/users'
    fill_in 'Email', :with => "binod@jyaasa.com"
    click_button 'Add User'
    page.should have_content "An invitation email has been sent to binod@jyaasa.com"
  end

end