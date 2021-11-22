class AuthenticationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :email
end
