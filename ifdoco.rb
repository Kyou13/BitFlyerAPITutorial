require "net/http"
require "uri"
require "openssl"

def ifdoco
  key = API_KEY
  secret = API_SECRET
  
  timestamp = Time.now.to_i.to_s
  method = "POST"
  uri = URI.parse("https://api.bitflyer.jp")
  uri.path = "/v1/me/sendparentorder"
  # 1つ目がIFD,2,3つ目がOCO
  body = '{
    "order_method": "IFDOCO",
    "minute_to_expire": 10000,
    "time_in_force": "GTC",
    "parameters": [{
      "product_code": "BTC_JPY",
      "condition_type": "LIMIT",
      "side": "BUY",
      "price": 30000,
      "size": 0.1
    },
    {
      "product_code": "BTC_JPY",
      "condition_type": "LIMIT",
      "side": "SELL",
      "price": 32000,
      "size": 0.1
    },
    {
      "product_code": "BTC_JPY",
      "condition_type": "STOP_LIMIT",
      "side": "SELL",
      "price": 28800,
      "trigger_price": 29000,
      "size": 0.1
    }]
  }'
  
  text = timestamp + method + uri.request_uri + body
  sign = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), secret, text)
  
  options = Net::HTTP::Post.new(uri.request_uri, initheader = {
      "ACCESS-KEY" => key,
        "ACCESS-TIMESTAMP" => timestamp,
          "ACCESS-SIGN" => sign,
            "Content-Type" => "application/json"
  });
  options.body = body
  
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  response = https.request(options)
  puts response.body
end
