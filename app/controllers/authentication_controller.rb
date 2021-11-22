class AuthenticationController < ApiController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    user = User.find_by(email: params[:email])
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(user: UserSerializer.new(user), auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password, :username)
  end
end
