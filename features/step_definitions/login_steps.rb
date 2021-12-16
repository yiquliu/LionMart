
Given /^(?:|My )login email address is "([^"]*)"$/ do |email|
  $test_mode = true
  $test_email = email
end
