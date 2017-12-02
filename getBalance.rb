require "net/http"
require "uri"
require "openssl"
require "json"

def get_balance(coinName)
  key = API_KEY
  secret = API_SECRET
  
  timestamp = Time.now.to_i.to_s
  method = "GET"
  uri = URI.parse("https://api.bitflyer.jp")
  uri.path = "/v1/me/getbalance"
  
  
  text = timestamp + method + uri.request_uri
  sign = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), secret, text)
  
  options = Net::HTTP::Get.new(uri.request_uri, initheader = {
      "ACCESS-KEY" => key,
        "ACCESS-TIMESTAMP" => timestamp,
          "ACCESS-SIGN" => sign,
  });
  
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  response = https.request(options)
  puts response.body
  # json => Array
  response_hash = JSON.parse(response.body)
  puts response_hash.class
  #puts response_hash[0] # JPYのamount
  puts response_hash.find {|n| n["currency_code"] == coinName}
end
