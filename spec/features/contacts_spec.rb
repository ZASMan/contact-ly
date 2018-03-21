require "rails_helper"

RSpec.feature "Contacts Index Page", :type => :feature do
  feature "CSV Upload" do
    before do

    end
    it 'allows a user to upload a CSV file' do
      # Puts location to the file
      # Press upload button
      # expect(Contact.count).to be > 0
    end
  end

  feature "Filtering" do
    it "displays alphabetical email addresses by default" do
      # Check the first TR row to make sure it returns the first alphabetical contact
    end

    it "allows a user to search by email address containing" do
      # Assure that the page only contains .com email addresses after hitting the search
    end
  end
end
