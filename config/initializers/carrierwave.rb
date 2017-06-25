# firehose track 4, lesson 22 (challenge) image upload - file created 24 jun 17
#
# config/initializers/carrierwave.rb

CarrierWave.configure do |config|

# fog code commented out and carrier-aws code added 25 jun 17 for better video upload (lesson 24)
#    config.fog_provider = 'fog/aws'                        # required
#    config.fog_credentials = {
#        provider:              'AWS',                        # required
#        aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
#        aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
#    }
#    config.fog_directory  = ENV["AWS_BUCKET"]              # required

  config.storage    = :aws
  config.aws_bucket = ENV["AWS_BUCKET"]
  config.aws_acl    = "public-read"

  config.aws_credentials = {
      access_key_id:     ENV["AWS_ACCESS_KEY"],
      secret_access_key: ENV["AWS_SECRET_KEY"],
      region:            ENV["AWS_REGION"]
  }
  
end
