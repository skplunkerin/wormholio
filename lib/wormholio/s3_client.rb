require "s3"

class S3Client

  def self.upload(creds,local_path,filename)
    p 'S3 UPLOAD'
    connect(creds)
    file = @wormholio_bucket.objects.build("#{creds['dir_path']}#{filename}")
    file.content = open("#{local_path}#{filename}")
    file.save
  end

  def self.download(creds,local_path,filename)
    p 'S3 DOWNLOAD'
    connect(creds)
    file = @wormholio_bucket.objects.find("#{creds['dir_path']}#{filename}")
    File.open("#{local_path}#{filename}", 'w') do |f| 
      f.write("#{file.content(true)}")
    end
  end

  private
    def self.connect(creds)
      p 'ESTABLISH S3 CONNECTION'
      s3 = S3::Service.new(
        :access_key_id      => creds["access_key_id"], 
        :secret_access_key  => creds["secret_access_key"]
      )
      @wormholio_bucket = s3.buckets.find(creds["bucket_name"])
    end
end
