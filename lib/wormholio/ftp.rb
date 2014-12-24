require "net/ftp"

class Ftp 

    def self.upload(creds,file,options={})
        p 'FTP UPLOAD'
        connect(creds,options)
        @wormholio_ftp.chdir("#{creds['dir_path']}")
        @wormholio_ftp.putbinaryfile(file)
        close_connection()
    end 

    def self.download(creds,local_path,filename,options={})
        p 'FTP DOWNLOAD'
        connect(creds,options)
        @wormholio_ftp.chdir("#{creds['dir_path']}")
        @wormholio_ftp.getbinaryfile(filename,"#{local_path}#{filename}")
        close_connection()
    end 

    private
      def self.connect(creds, options)
          p 'ESTABLISH FTP CONNECTION'
          host = creds["host"] # Host to connect too
          port = (creds["port"]) ? creds["port"] : 21 # Default to port 21 unless port is given
          username = creds["username"] # Username to connect with
          password = creds["password"] # Password for username

          @wormholio_ftp = Net::FTP.new

          if options["debug"]
            p 'Debug Mode'
            p options["debug"]
            @wormholio_ftp.debug_mode = options["debug"] # Debug mode
          end
          if options["passive"]
            p 'Passive'
            p options["passive"]
            @wormholio_ftp.passive = options["passive"] # Passive connection
          end
          @wormholio_ftp.connect(host,port)
          @wormholio_ftp.login(username, password)
      end 

      def self.close_connection
          p 'CLOSE FTP CONNECTION'
          @wormholio_ftp.close
      end

end
