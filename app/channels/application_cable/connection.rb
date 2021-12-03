module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.id
    end

    private
    
    def find_verified_user
      current_user = User.find_by(auth_token: request.params[:auth_token])
      unless current_user.nil?
        return current_user
      else
        return reject_unauthorized_connection
      end
    end
  end
end
