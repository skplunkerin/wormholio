require "wormholio/version"
require "wormholio/ftp"
require "wormholio/ftps"
require "wormholio/sftp"
require "wormholio/scp"

module Wormholio

  module FTP

    def self.upload(credentials,file,options={})
      Ftp.upload(credentials,file,options)
    end

    def self.download(credentials,local_path,filename,options={})
      Ftp.download(credentials,local_path,filename,options)
    end

  end

  module FTPS

    def self.upload(credentials,file,options={})
      Ftps.upload(credentials,file,options)
    end

    def self.download(credentials,local_path,filename,options={})
      Ftps.download(credentials,local_path,filename,options)
    end

  end

  module SFTP

    def self.upload(credentials,local_path,filename)
      Sftp.upload(credentials,local_path,filename)
    end

    def self.download(credentials,local_path,filename)
      Sftp.download(credentials,local_path,filename)
    end

  end

  module SCP
    # TODO

    def self.upload(credentials,local_path,filename)
      Scp.upload(credentials,local_path,filename)
    end

    def self.download(credentials,local_path,filename)
      Scp.download(credentials,local_path,filename)
    end

  end

  module S3
    # TODO
  end

end
