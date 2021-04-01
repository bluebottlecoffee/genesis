# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'genesis/version'

Gem::Specification.new do |spec|
  spec.name          = 'item-genesis'
  spec.version       = Genesis::VERSION
  spec.licenses      = ['AGPL-3.0']
  spec.authors       = ['Blue Bottle Coffee']
  spec.email         = ['opensource@bluebottlecoffee.com']

  spec.summary       = 'The genesis of PIM'
  spec.description   = 'The genesis of PIM'
  spec.homepage      = 'https://github.com/bluebottlecoffee/genesis'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = spec.homepage
    spec.metadata['changelog_uri'] = 'https://github.com/bluebottlecoffee/genesis/blob/master/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 13.0'

  spec.add_runtime_dependency 'dry-monads', '~> 1.3.5'
  spec.add_runtime_dependency 'dry-validation', '~> 1.5.0'
  spec.add_runtime_dependency 'pg', '~> 1.2.2'
  spec.add_runtime_dependency 'sequel', '>= 5.30', '< 5.44'
  spec.add_runtime_dependency 'ulid', '~> 1.2.0'
end
