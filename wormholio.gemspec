# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wormholio/version'

Gem::Specification.new do |spec|
  spec.name          = "wormholio"
  spec.version       = Wormholio::VERSION
  spec.authors       = ["Christopher Reynolds"]
  spec.email         = ["reynolds87chris@gmail.com"]
  spec.summary       = %q{Currently under development... Upload/Download functionality for FTP, FTPS and SFTP.}
  spec.description   = %q{Currently under development... (First gem) Wormholio provides simple Upload/Download functionality for all file transfer methods. Currently supported transfer methods: FTP, FTPS and SFTP; soon to be supported: SCP &amp; S3.}
  spec.homepage      = "https://github.com/skplunkerin/wormholio"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "double-bag-ftps", "~> 0.1"
  spec.add_dependency "net-sftp", "~> 2.1"
  spec.add_dependency "net-scp", "~> 1.2"
  spec.add_dependency "s3", "~> 0.3"

  # Development dependencies (usually used for testing)
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  # spec.add_development_dependency "double-bag-ftps", "~> 0.1"
  # spec.add_development_dependency "net-sftp", "~> 2.1"
  # spec.add_development_dependency "net-scp", "~> 1.2"
  # spec.add_development_dependency "s3", "~> 0.3"
end
