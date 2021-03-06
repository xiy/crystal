require "./access_token"

class OAuth2::AccessToken::Bearer < OAuth2::AccessToken
  def token_type
    "Bearer"
  end

  def authenticate(request : HTTP::Request, ssl)
    request.headers["Authorization"] = "Bearer #{access_token}"
  end

  def to_json(io)
    io.json_object do |object|
      object.field "token_type", "Bearer"
      object.field "access_token", access_token
      object.field "expires_in", expires_in
      object.field "refresh_token", refresh_token if refresh_token
      object.field "scope", scope if scope
    end
  end

  def_equals_and_hash access_token, expires_in, refresh_token, scope
end
