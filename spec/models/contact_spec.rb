require "rails_helper"

RSpec.describe Contact, :type => :model do
  describe 'General requirements' do
    let(:contact) { Contact.new }
    let(:attributes) { %w[first_name last_name email_address phone_number company_name]}
    it 'has the expected attributes' do
      attributes.each { |attribute| expect(contact.attributes).to include(attribute) }
    end
  end
end