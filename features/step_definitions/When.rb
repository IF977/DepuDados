When(/^[I ]*click on the ([^"]*) link$/) do |link|
  click_link(link)
end

When(/^I visit ([^"]*) link$/) do |link|
  visit(link)
end

When(/^[I ]*fill ([^"]*) input with ([^"]*)$/) do |input, data|
  fill_in(input, :with => data)
end

When(/^[I ]*click on the ([^"]*) button$/) do |button|
  click_button(button)
end

When(/^[I ]*select ([^"]*) on the ([^"]*)$/) do |data, selection|
  select('data', :from => 'selection')
end
