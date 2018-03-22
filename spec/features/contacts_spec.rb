require "rails_helper"

RSpec.feature "Contacts Index Page", :type => :feature do
  feature "CSV Upload" do
    let(:last_contact) { Contact.last }

    it 'allows a user to upload a CSV file' do
      visit contacts_path 
      attach_file('file', "#{Rails.root}/data.csv")
      click_button("Import Contact CSV")
      expect(Contact.count).to be > 0
      expect(page.current_path).to eq contacts_path
      visit contacts_path
    end
  end

  feature "Filtering" do
    let(:contact_com_email) do
      Contact.create(
        first_name: "Albany",
        last_name: "Anderson",
        email_address: "albany.anderson@test.com"
      )
    end
    let(:contact_no_com_email) do
      Contact.create(
        first_name: "Zabony",
        last_name: "Zest",
        email_address: "zabony.zest@test.net"
      )
    end
    let(:first_row) { first('.contact-row') }

    before do
      contact_com_email
      contact_no_com_email
      visit contacts_path
    end

    it "displays alphabetical email addresses by default" do
      within(first_row) do
        expect(page).to have_text(contact_com_email.first_name)
      end
    end

    it "allows a user to search by email address containing" do
      # Assure that the page only contains .com email addresses after hitting the search
      # Appears by default, in form ignore this.
      # fill_in 'q_email_address_cont', with: ".com"
      click_button("Apply")
      expect(page).to_not have_text(contact_no_com_email.email_address)
      expect(page).to have_text(contact_com_email.email_address)
    end
  end
end
