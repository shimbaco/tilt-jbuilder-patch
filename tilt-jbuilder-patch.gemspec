lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tilt/jbuilder/patch/version'

Gem::Specification.new do |spec|
  spec.name          = 'tilt-jbuilder-patch'
  spec.version       = Tilt::Jbuilder::Patch::VERSION
  spec.authors       = ['Koji Shimba']
  spec.email         = ['bojovs@gmail.com']
  spec.summary       = 'A monkey patch for tilt-jbuilder'
  spec.homepage      = 'https://github.com/bojovs/tilt-jbuilder-patch'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'tilt-jbuilder', '~> 0.6.0'
  spec.add_dependency 'jbuilder',      '~> 2.0.7'
end
