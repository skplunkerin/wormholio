require "double_bag_ftps"

class Ftps

  def self.upload(creds,file,options={})
    p 'FTPS UPLOAD'
    connect(creds,options)
    @wormholio_ftps.chdir("#{creds['dir_path']}")
    @wormholio_ftps.putbinaryfile(file)
    close_connection()
  end

  def self.download(creds,local_path,filename,options={})
    p 'FTPS DOWNLOAD'
    connect(creds)
    @wormholio_ftps.chdir("#{creds['dir_path']}")
    @wormholio_ftps.getbinaryfile(filename,"#{local_path}#{filename}")
    close_connection()
  end

  private
    def self.connect(creds,options)
      p 'ESTABLISH FTPS CONNECTION'
      host = creds["host"] # Host to connect too
      port = (creds["port"]) ? creds["port"] : 21 # Default to port 21 unless port is given
      username = creds["username"] # Username to connect with
      password = creds["password"] # Password for username
      verify_mode = OpenSSL::SSL::VERIFY_NONE # Do not verify host's certificate
      
      # Connect to a host using explicit FTPS
      @wormholio_ftps = DoubleBagFTPS.new
      @wormholio_ftps.ssl_context = DoubleBagFTPS.create_ssl_context(:verify_mode => verify_mode)
      if options["debug"]
        p 'Debug Mode'
        p options["debug"]
        @wormholio_ftps.debug_mode = options["debug"] # Debug mode
      end
      if options["passive"]
        p 'Passive'
        p options["passive"]
        @wormholio_ftps.passive = options["passive"] # Passive connection
      end
      @wormholio_ftps.connect(host, port)
      @wormholio_ftps.login(username, password)
    end

    def self.close_connection
      p 'CLOSE FTPS CONNECTION'
      @wormholio_ftps.close
    end

end
