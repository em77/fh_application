class AppS3Uploader
  def initialize(app_file_path, directory_name)
    @app_file_path = app_file_path
    @directory_name = directory_name
  end

  def upload
    bucket.files.create(
      key:    "applications/#{@directory_name}/#{File.basename(@app_file_path)}",
      body:   File.open(@app_file_path),
      public: true
    )
  end

  private

  def bucket
    connection.directories.get(ENV['BUCKET_NAME'])
  end

  def connection
    @connection ||= Fog::Storage.new({
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region:                'us-east-1'
    })
  end
end
