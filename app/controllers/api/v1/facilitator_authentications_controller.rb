require 'net/http'
require "json"

class Api::V1::FacilitatorAuthenticationsController < ApplicationController
  def authenticate
    access_token = get_access_token
    user = User.find_by(user_access_token: access_token)
    if user
      render json: user.as_json
    else
      identity = get_user_identity(access_token)
      display_name = get_display_name(access_token)
      user = User.create!(
        name: identity["user"]["name"],
        user_slack_id: identity["user"]["id"],
        user_team_id: identity["team"]["id"],
        user_access_token: access_token,
        display_name: display_name
      )
      render json: user.as_json
    end
  end

  def get_access_token
    oauth_access_url = "https://slack.com/api/oauth.access?client_id=#{ENV["CLIENT_ID"]}&client_secret=#{ENV["CLIENT_SECRET"]}&code=#{params[:token]}"
    access_request = get_request(oauth_access_url)
    if access_request["ok"] == true
      access_request["access_token"]
    else
      render json: { success: false, message: 'Authentication code has expired' }
    end
  end

  def get_user_identity(token)
    identity_url = "https://slack.com/api/users.identity?token=#{token}"
    identity_request = get_request(identity_url)
    if identity_request["ok"] == true
      identity_request
    else
      render json: { success: false, message: 'Authentication failed' }
    end
  end

  def get_display_name(token)
    profile_url = "https://slack.com/api/users.profile.get?token=#{token}"
    profile = get_request(profile_url)
    if profile["ok"] == true
      profile["profile"]["display_name"]
    else
      render json: { success: false, message: 'Couldn\'t get profile' }
    end
  end

  def get_request(token)
    response = Net::HTTP.get(URI(token))
    parsed_response = JSON.parse(response)
  end
end
