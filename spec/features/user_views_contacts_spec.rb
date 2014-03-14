require 'spec_helper'

feature "User views contacts" do
  scenario "user views all of their contacts" do
    eric = Contact.create(first_name: "Eric", last_name: "Kelly", phone_number: "1234567890")
    faizaan = Contact.create(first_name: "Faizaan", last_name: "Shamsi", phone_number: "1234567890")

    visit '/'

    expect(page).to have_content "#{eric.name} - #{eric.phone_number}"
    expect(page).to have_content "#{faizaan.name} - #{faizaan.phone_number}"
  end
end
