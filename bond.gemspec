Gem::Specification.new do |s|
  s.name    = "bond"
  s.version = "0.5.0"

  s.homepage    = "http://github.com/brjennin/bond"
  s.summary     = "HTTP User Agent parser"
  s.description = <<-EOS
    Finds user agents - Basically the same as UserAgent gem but we had namespacing issues
  EOS

  s.files = [
    "lib/bond.rb",
    "lib/bond/browsers.rb",
    "lib/bond/browsers/all.rb",
    "lib/bond/browsers/gecko.rb",
    "lib/bond/browsers/internet_explorer.rb",
    "lib/bond/browsers/opera.rb",
    "lib/bond/browsers/webkit.rb",
    "lib/bond/comparable.rb",
    "lib/bond/operating_systems.rb",
    "lib/bond/version.rb",
    "lib/bond.rb",
    "LICENSE",
    "README.rdoc"
  ]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

  s.author = "Joshua Peek"
  s.email  = "josh@joshpeek.com"
end
