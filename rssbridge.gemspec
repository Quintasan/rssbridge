# frozen_string_literal: true

require_relative "lib/rssbridge/version"

Gem::Specification.new do |spec|
  spec.name = "rssbridge"
  spec.version = Rssbridge::VERSION
  spec.authors = ["Michał Zając"]
  spec.email = ["michal.zajac@gmail.com"]

  spec.summary = "Framework for creating RSS feeds out of websites"
  spec.homepage = "https://gitlab.com/Quintasan/rssbridge"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://gitlab.com/Quintasan/rssbridge"
  spec.metadata["changelog_uri"] = "https://gitlab.com/Quintasan/rssbridge/-/raw/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "zeitwerk", "~> 2.5.4"
  spec.add_dependency "tty-logger", "~> 0.6.0"
  spec.add_dependency "redis", "~> 4.5.1"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
end
