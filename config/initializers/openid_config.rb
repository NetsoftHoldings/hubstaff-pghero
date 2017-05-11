OpenIDConnect.logger = WebFinger.logger = SWD.logger = Rack::OAuth2.logger = Rails.logger
if Rails.env.development?
  OpenIDConnect.debug!

  SWD.url_builder = WebFinger.url_builder = URI::HTTP
end

HubstaffAuth.configure do |config|
  config.issuer = ENV['OPENID_ISSUER'] || 'http://localhost:3001'
  config.identifier = ENV['OPENID_IDENTIFIER'] || 'HSPGHero'
  config.secret = ENV['OPENID_SECRET'] || 'HSPGHeroSecret'
  config.mode = :rp
end
