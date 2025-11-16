require "json"
require "http/client"

class HeyBounce
  API_PATH = "v1"
  def initialize(@api_key : String)
    @headers = HTTP::Headers {
      "Content-Type" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://api.heybounce.io")
    @http_client = HTTP::Client.new(uri)
  end

  def validate_email(email : String) : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/validate?email=#{email}&api_key=#{@api_key}", headers: @headers).body)
  end

  def get_credits() : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/credits?api_key=#{@api_key}", headers: @headers).body)
  end
end
