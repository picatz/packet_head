# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "packet_head/version"

Gem::Specification.new do |spec|
  spec.name          = "packet_head"
  spec.version       = PacketHead::VERSION
  spec.authors       = ["Kent 'picat' Gruber"]
  spec.email         = ["kgruber1@emich.edu"]

  spec.summary       = %q{Streaming packet header types to the command-line.}
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/picatz/packet_head"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = 'bin'
  spec.executable    = "packet_head"
  spec.require_paths = ['lib']

  spec.add_dependency "command_lion", "~> 1.0.1"
  spec.add_dependency "packetgen", "~> 2.1.0"
  spec.add_dependency "colorize", "~> 0.8.1"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
