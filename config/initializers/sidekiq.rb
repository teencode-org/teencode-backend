redis = Redis.new
size = Rails.env.production? ? 10 : 5
redis_config = {
  size: size,
  url: ENV["REDISTOGO_URL"],
  namespace: "teencode_api"
}


[:configure_client, :configure_server].each do |config|
  Sidekiq.send(config){ |con| con.redis =  redis_config }
end
