require 'rails_helper'

RSpec.feature "Visitor can create user account" do
  scenario "they see their user splash page" do
    visit root_path

    click_on "Register"

    fill_in "Username"
  end
end
