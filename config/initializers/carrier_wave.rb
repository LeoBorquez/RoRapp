require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_crendentials = {
        # Amazon S3 configuration
        :provider => 'AWS',
        :aws_access_key_id => 'S3_ACCESS_KEY',
        :aws_secret_access_key => 'S3_SECRET_KEY'
    }
    config.fog_directory = 'S3_BUCKET',
    config.fog_provider = 'fog/aws'
    config.storage = :fog
  end

end
