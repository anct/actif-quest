CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: ENV['S3_REGION'],
      path_style: true,
    }
    if Rails.env.production?
      config.fog_directory = ENV['S3_BUCKET_PRODUCTION']
    elsif Rails.env.staging?
      config.fog_directory = ENV['S3_BUCKET_STAGING']
    end
    config.storage :fog
    config.asset_host = ENV['S3_ASSET_HOST']
  else
    config.storage :file
  end
end