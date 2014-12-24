class Ftp 
    require 'net/ftp'

    def self.upload(creds,file,options={})
        p 'FTP UPLOAD'
        connect(creds,options)
        @wormholio_ftp.chdir("#{creds[:dir_path]}")
        @wormholio_ftp.putbinaryfile(file)
        close_connection()
    end 

    def self.download(creds,local_path,filename,options={})
        p 'FTP DOWNLOAD'
        connect(creds,options)
        @wormholio_ftp.chdir("#{creds[:dir_path]}")
        @wormholio_ftp.getbinaryfile(filename,"#{local_path}#{filename}")
        close_connection()
    end 

    private
    def self.connect(creds, options)
        p 'ESTABLISH FTP CONNECTION'
        host = creds[:host] # Host to connect too
        port = (creds[:port]) ? creds[:port] : 21 # Default to port 21 unless port is given
        username = creds[:username] # Username to connect with
        password = creds[:password] # Password for username

        @wormholio_ftp = Net::FTP.new

        if options[:debug_mode]
          @wormholio_ftp.debug_mode = debug # Debug mode
        if options[:passive]
          @wormholio_ftp.passive = passive # Passive connection
        @wormholio_ftp.connect(host,port)
        @wormholio_ftp.login(username, password)
    end 

    def self.close_connection
        p 'CLOSE FTP CONNECTION'
        @wormholio_ftp.close
    end
end
