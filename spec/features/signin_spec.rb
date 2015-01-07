require 'spec_helper'
feature "sign up and sign in", :js => true do
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
  end
end