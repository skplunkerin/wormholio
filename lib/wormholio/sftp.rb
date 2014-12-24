require 'net/ssh'
require 'net/sftp'

class Sftp

  def self.upload(creds,local_path,filename)
    p 'SFTP UPLOAD'
    connect(creds)
    @wormholio_sftp.upload!("#{local_path}#{filename}","#{creds['dir_path']}#{filename}")
  end

  def self.download(creds,local_path,filename)
    p 'SFTP DOWNLOAD'
    connect(creds)
    @wormholio_sftp.download!("#{creds['dir_path']}#{filename}","#{local_path}#{filename}")
  end

  private
    def self.connect(creds)
      p 'ESTABLISH SFTP CONNECTION'
      host = creds["host"]
      username = creds["user"]
      password = creds["password"]
      port = creds["port"]

      session = Net::SSH.start(host, username, :password => password, :port => port)
      @wormholio_sftp = Net::SFTP::Session.new(session).connect!
    end

end
