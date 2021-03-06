# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))
Given /the following products exist/ do |product_table|
  product_table.hashes.each do |product|
    Post.create product
  end
end

Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
    User.create user
  end
end
# And /^I have logged in as "([^"]*)"$/ do
#   visit(posts_path)
  # fill_in('Email', :with => email)
  # fill_in('Email', :with => email)
  # fill_in('Password', :with => 's3cr3t')
  # fill_in('Password Confirmation', :with => 's3cr3t')
  # click_button('Sign up')
# end
When /^(?:|I )press "([^"]*)"$/ do |button|
  if button == "Sign in with Google account"
    if $test_email.end_with?("columbia.edu")
      visit path_to("the home page")
    end
  else
    click_link_or_button(button)
  end
end

# And /^(?:|I )am "([^"]*)"$/ do |name|
#   User.create name
# end
#
Given /^(?:|I )am "([^"]*)"$/ do |name|
  User.create(user_name: name)
  $current = name
end

And /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  puts page
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end


When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should not go to (.+)$/ do |page_name|
  not visit path_to(page_name)
end

Then /^the price of "([^"]*)" should be "([^""]*)"$/ do |product_title, field_detail|
  if page.respond_to? :should
    page.should have_content(product_title)
    page.should have_content(field_detail)
  else
    assert page.has_content?(product_title)
    assert page.has_content?(field_detail)
  end
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end
