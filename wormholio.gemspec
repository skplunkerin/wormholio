# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wormholio/version'

Gem::Specification.new do |spec|
  spec.name          = "wormholio"
  spec.version       = Wormholio::VERSION
  spec.authors       = ["Christopher Reynolds"]
  spec.email         = ["reynolds87chris@gmail.com"]
  spec.summary       = %q{Currently under development... Will have support for FTP, FTPS, SFTP, SCP and S3.}
  spec.description   = %q{If you want one gem that can utilize all file transfer methods, use Wormholio. Currently supported transfer method: FTP; soon to be supported: FTPS, SFTP, SCP & S3.}
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
