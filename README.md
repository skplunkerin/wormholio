# Wormholio

This gem was created to be a one-stop-shop for all file transfer methods that anyone would need to use in their ruby application. 
The current methods I found available were cryptric, and the documentation available for these methods offered no help. 
After creating blog posts on the methods I needed to support ([S3](http://skplunkerin.com/s3-with-ruby-on-rails/) && [FTP, FTPS, SFTP & SCP](http://skplunkerin.com/ftp-ftps-sftp-scp-ruby-on-rails/)), my buddies then recommended converting these classes into a single gem... and so I did.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wormholio'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install wormholio

## Usage

### FTP:
- **Note:** dir_path should look like "/folder/"; be sure to prepend/append "/"

```
hash = {
  'host':'www.domain.com',     # domain to connect to
  'username':'steven',         # username
  'password':'Steve1',         # user's password
  'dir_path':'/home/',         # directory path on server
  'port':'21'                  # will default to 21 if not specified
}
options = {"debug"=>true}         # If debug set to true, will return errors for testing

file = "#{Rails.root}/file.json"  # Path/name of file to upload

  # To upload
  Wormholio::FTP.upload( hash, file, options )

local_path = "#{Rails.root}/"     # Where to download file to
filename = "file.json"            # Name of file

  # To download
  Wormholio::FTP.download( hash, local_path, filename, options )
```

### FTPS:
- **Note:** dir_path should look like "/folder/"; be sure to prepend/append "/"

```
hash = {
  'host':'www.domain.com',     # domain to connect to
  'username':'steven',         # username
  'password':'Steve1',         # user's password
  'dir_path':'/home/',         # directory path on server
  'port':'21'                  # will default to 21 if not specified
}
options = {"debug"=>true}         # If debug set to true, will return errors for testing

file = "#{Rails.root}/file.json"  # Path/name of file to upload

  # To upload
  Wormholio::FTPS.upload( hash, file, options )

local_path = "#{Rails.root}/"     # Where to download file to
filename = "file.json"            # Name of file

  # To download
  Wormholio::FTPS.download( hash, local_path, filename, options )
```

### SFTP:
- **Note:** dir_path should look like "/folder/"; be sure to prepend/append "/"

```
hash = {
  'host':'www.domain.com',     # domain to connect to
  'username':'steven',         # username
  'password':'Steve1',         # user's password
  'dir_path':'/home/',         # directory path on server
  'port':'21'                  # will default to 21 if not specified
}
options = {"debug"=>true}         # If debug set to true, will return errors for testing

file = "#{Rails.root}/file.json"  # Path/name of file to upload

  # To upload
  Wormholio::SFTP.upload( hash, file, options )

local_path = "#{Rails.root}/"     # Where to download file to
filename = "file.json"            # Name of file

  # To download
  Wormholio::SFTP.download( hash, local_path, filename, options )
```

### SCP:
- **Note:** dir_path should look like "/folder/"; be sure to prepend/append "/"

```
hash = {
  'host':'www.domain.com',     # domain to connect to
  'username':'steven',         # username
  'password':'Steve1',         # user's password
  'dir_path':'/home/',         # directory path on server
  'port':'21'                  # will default to 21 if not specified
}
options = {"debug"=>true}         # If debug set to true, will return errors for testing

file = "#{Rails.root}/file.json"  # Path/name of file to upload

  # To upload
  Wormholio::SCP.upload( hash, file, options )

local_path = "#{Rails.root}/"     # Where to download file to
filename = "file.json"            # Name of file

  # To download
  Wormholio::SCP.download( hash, local_path, filename, options )
```

### S3:
- **Note:** dir_path should look like "folder/"; be sure to append "/" to this

```
hash = {
  'bucket_name':'bucket-name',           # domain to connect to
  'access_key_id':'big-ole-access-key',  # username
  'secret_access_key':'big-ole-secret',  # user's password
  'dir_path':'folder/'                   # directory path on server
}

local_path = "#{Rails.root}/"               # Path to file we want to upload
filename = "file.json"                      # Name of file to upload

  # To upload
  Wormholio::S3.upload( hash, local_path, filename )

local_path = "#{Rails.root}/"               # Path to download file to
filename = "file.json"                      # Name we want download file to have

  # To download
  Wormholio::S3.download( hash, local_path, filename )
```


## Contributing

1. Fork it ( https://github.com/skplunkerin/wormholio/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
