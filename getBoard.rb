# 板情報取得

# 外部ライブラリ読み込み
require 'net/http'
require 'uri'
require 'json'

def get_price
  uri = URI.parse("https://api.bitflyer.jp") # パース
  uri.path = '/v1/getboard' # 付加するparam
  uri.query = ''
  
  # Net::HTTPオブジェクト生成
  # params(address, port)
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true # SSL/TLS を利用するかどうか
  response = https.get(uri.request_uri) # path + '?' + query」を文字列で返す
  response_hash = JSON.parse(response.body)
  response_hash["mid_price"]
end
