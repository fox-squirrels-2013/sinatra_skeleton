require_relative '../spec_helper'

feature "user log in" do
  scenario "user can log in with correct credentials" do
    email = "foob@goob.com"
    password = "pass123"
    page.visit "/sign_up"
    page.fill_in "email", {:with => email}
    page.fill_in "password", {:with => password }
    page.click_button "Sign up!"
    page.visit "/"
    page.fill_in "email", {:with => email}
    page.fill_in "password", {:with => password }
    page.click_button "Sign in!"
    page.should have_content("Your session: foob@goob.com")
  end

  scenario "user can't log in with incorrect credentials" do
    email = "foob@goob.com"
    password = "pass123"
    page.visit "/sign_up"
    page.fill_in "email", {:with => email}
    page.fill_in "password", {:with => password }
    page.click_button "Sign up!"
    page.visit "/"
    page.fill_in "email", {:with => "fib@goob.com"}
    page.fill_in "password", {:with => password }
    page.click_button "Sign in!"
    page.should have_content("Your login information was incorrect.")
  end
end

feature "user feeds" do
  scenario "guest can't view feed" do
    page.visit "/33"
    page.should have_content("We're sorry, but only registered users may view member content.")
  end
end
