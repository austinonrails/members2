Recaptcha.configure do |config|
  config.public_key  = ENV['RECAPTCHA_KEY']
  config.private_key = ENV['RECAPTCHA_SECRET']
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end
