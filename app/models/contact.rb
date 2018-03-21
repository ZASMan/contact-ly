class Contact < ApplicationRecord
  require 'csv'

  # CSV Hash Structure
  # []

  def self.csv_upload(file)
    CSV.foreach(file.path, headers: true) do |row|
      Contact.create!(
        first_name: row[0],
        last_name: row[1],
        email_address: row[2],
        phone_number: row[3],
        company_name: row[4],
      )
    end
  end
end
