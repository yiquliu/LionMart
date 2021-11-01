Given /the following products exist/ do |product_table|
  product_table.hashes.each do |product|
    Post.create product
  end
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

And /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
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
