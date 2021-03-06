When(/^I browse the default page$/) do
  visit '/'
end

Given(/^I am logged in as job offerer$/) do
  visit '/login'
  fill_in('user[email]', :with => 'offerer@test.com')
  fill_in('user[password]', :with => 'Passw0rd!')
  click_button('Login')
  page.should have_content('offerer@test.com')
end

Given(/^I access the new offer page$/) do
  visit '/job_offers/new'
  page.should have_content('Title')
end

When(/^I fill the title with "(.*?)"$/) do |offer_title|
  fill_in('job_offer[title]', :with => offer_title)
end


When(/^confirm the new offer$/) do
  click_button('Create')
end

Then(/^I should see "(.*?)" in My Offers$/) do |content|
	visit '/job_offers/my'
  page.should have_content(content)
end


Then(/^I should not see "(.*?)" in My Offers$/) do |content|
  visit '/job_offers/my'
  page.should_not have_content(content)
end

Given(/^I have "(.*?)" offer in My Offers$/) do |offer_title|
  JobOffer.all.destroy
  visit '/job_offers/new'
  fill_in('job_offer[title]', :with => offer_title)
  click_button('Create')
end

Given(/^I edit it$/) do
  click_link('Edit')
end

And(/^I delete it$/) do
  click_button('Delete')
end

Given(/^I set title to "(.*?)"$/) do |new_title|
  fill_in('job_offer[title]', :with => new_title)
end

Given(/^I save the modification$/) do
  click_button('Save')
end

When(/^I fill the category with "(.*?)"$/) do |arg1|
  fill_in('job_offer[category]', :with => arg1)
end

Given(/^I set category to "(.*?)"$/) do |arg1|
  fill_in('job_offer[category]', :with => arg1)
end




Given(/^there is a "(.*?)" offer$/) do |arg1|
  JobOffer.all.destroy
user = User.create(:email => 'offerer22@test.com',
                   :name => 'Offerer2', 
                   :password => "Passw0rd!")
 job_offer = JobOffer.new
 job_offer.title = title
 job_offer.owner = user
 job_offer.save
end

When(/^I click "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^write my  question$/) do
  pending # express the regexp above with the code you wish you had
end
