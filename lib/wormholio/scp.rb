require "net/ssh"
require "net/scp"

class Scp

  def self.upload(creds,local_path,filename)
    p 'SCP UPLOAD'
    connect(creds)
    @ssh.scp.upload!("#{local_path}#{filename}","#{creds['dir_path']}#{filename}")
  end

  def self.download(creds,local_path,filename)
    p 'SCP DOWNLOAD'
    connect(creds)
    @ssh.scp.download!("#{creds['dir_path']}#{filename}","#{local_path}#{filename}")
  end

  private
  def self.connect(creds)
    p 'ESTABLISH SCP CONNECTION'
    host = creds["host"]
    username = creds["username"]
    password = creds["password"]
    port = creds["port"]

    @ssh = Net::SSH.start(host, username, :password => password, :port => port)
  end
end
