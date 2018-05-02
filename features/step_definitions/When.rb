When(/^I visit ([^"]*) link$/) do |link|
  visit(link)
end

When(/^[I ]*fill ([^"]*) input with ([^"]*)$/) do |input, data|
  fill_in(input, :with => data)
end

When(/^[I ]*click on the ([^"]*) button$/) do |button|
  click_button(button)
end
