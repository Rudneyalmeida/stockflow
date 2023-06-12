# app/channels/application_cable/connection.rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      puts current_user
      puts "-----------------------------------------------------------------------"
      puts "-----------------------------------------------------------------------"
      puts "-----------------------------------------------------------------------"


      current_user
    end
  end
end
