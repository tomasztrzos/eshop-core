class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :street_address, :city, :zip_code, :country, :phone_number, :email
end
