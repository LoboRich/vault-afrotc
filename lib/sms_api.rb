require 'rest-client'
require 'json'

class SmsApi
  def initialize
    @apikey = ENV['SEMAPHORE_API_KEY']
    @sendername = nil
  end
  
  def send_message(message: nil, number: nil)
    uri     = Addressable::URI.new

    options = {
      apikey:     @apikey,
      number:     number,
      message:    message,
      sendername: @sendername
    }

    uri.query_values = options
    path = "https://semaphore.co/api/v4/messages?#{uri.query}"
    response = HTTP.post(path)

    JSON.parse(response).all? {|r| r['status'] != 'failed'}
  end

  def send_broadcast_message(message: nil, number: nil)
    res = nil

    payload = {
      apikey: @apikey,
      number: number,
      message: message,
      sendername: @sendername
    }.to_json

    req = RestClient::Request.new({
      method: :post,
      url: 'https://semaphore.co/api/v4/messages',
      payload: payload,
      headers: { :accept => :json, content_type: :json }
    }).execute do |response, request, result|
      res = JSON.parse(response.body)
      oh = OptionalHash.new(res)
      oh.value.first['status'].present? rescue false
    end
  end

  def get_account
    res = nil

    payload = {
      apikey: @apikey,
    }.to_json

    req = RestClient::Request.new({
      method: :get,
      url: 'https://api.semaphore.co/api/v4/account',
      payload: payload,
      headers: { :accept => :json, content_type: :json }
    }).execute do |response, request, result|
      @res = JSON.parse(response.body)
    end
  end

  def get_messages
    res = nil

    payload = {
      apikey: @apikey,
      limit: 1000
    }.to_json

    req = RestClient::Request.new({
      method: :get,
      url: 'https://api.semaphore.co/api/v4/messages',
      payload: payload,
      headers: { :accept => :json, content_type: :json }
    }).execute do |response, request, result|
      @res = JSON.parse(response.body)
    end
    @res
  end
end
