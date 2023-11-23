require 'jwt'
require 'openssl'
require 'net/http'

class BaseController < ApplicationController
    def bearer_token(token)
        pattern = /^Bearer /
        token.gsub(pattern, '') if token && token.match(pattern)
    end
    
    def authenticate_user
        bearer = bearer_token(request.headers['Authorization'])
        options = {
            algorithm: 'RS256',
            verify_aud: ENV['FIREBASE_PROJECT_ID'],
            verify_iss: "https://securetoken.google.com/#{ENV['FIREBASE_PROJECT_ID']}"
        }
        
        begin
            @user = JWT.decode(bearer, nil, true, options) do |header|
                url = URI('https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com')
                json = JSON.parse(Net::HTTP.get(url))
                OpenSSL::X509::Certificate.new(json[header['kid']]).public_key
            end

            session[:user_id] = @user.first["user_id"] || nil
        rescue StandardError
            render(json: {
                status: "error",
                message: "Token inválido!"
            }, status: :unauthorized)
        end
    end

    def current_user
        User.find_by(id: session[:user_id])
    end
end
