require "wormholio/version"

module Wormholio

  module FTP
    # TODO
    def self.upload(credentials,file,options={})
      Ftp.upload(credentials,file,options)
    end

    def self.download(credendtials,local_path,filename,options={})
      Ftp.download(credentials,file,options)
    end
  end

  module FTPS
    # TODO
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
