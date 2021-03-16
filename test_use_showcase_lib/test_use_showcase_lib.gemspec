require_relative 'lib/test_use_showcase_lib/version'

Gem::Specification.new do |spec|
  spec.name          = "test_use_showcase_lib"
  spec.version       = TestUseShowcaseLib::VERSION
  spec.authors       = ["Viacheslav Rostovtsev"]
  spec.email         = ["virost@google.com"]

  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = "http://foo.example.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://foo.example.com"
  spec.metadata["changelog_uri"] = "http://foo.example.com"

  spec.add_dependency "faraday"
  #  spec.add_dependency "google-showcase"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
