require "wormholio/version"
require "wormholio/ftp"
require "wormholio/ftps"

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
    # TODO
  end

  module SCP
    # TODO
  end

  module S3
    # TODO
  end

end
