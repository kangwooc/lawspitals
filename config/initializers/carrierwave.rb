CarrierWave.configure do |config|
    config.fog_provider = "fog/aws"
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: 'AKIAJHB5GKW7PIIHNFLQ',
        aws_secret_access_key: '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',
        region: 'us-west-2',
    }
    config.fog_directory = 'eugene-likelion-s3-bucket'
end