json.extract! contact, :id, :first_name, :last_name, :email_address, :phone_number, :company_name, :created_at, :updated_at
json.url contact_url(contact, format: :json)
