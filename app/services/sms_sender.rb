require 'net/http'
require 'uri'
require 'json'

class SmsSender
  API_URL = 'https://sms-api-ph-gceo.onrender.com/send/sms'
  API_KEY = ENV['SMS_API_KEY']

  def self.send_sms(recipient:, message:)
    uri = URI.parse(API_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, {
      'Content-Type' => 'application/json',
      'x-api-key' => API_KEY
    })

    request.body = { recipient: recipient, message: message }.to_json

    response = http.request(request)

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      { error: response.body, code: response.code }
    end
  rescue => e
    { error: e.message }
  end
end
