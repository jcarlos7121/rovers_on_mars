# encoding: utf-8

Gem::Specification.new do |s|
  s.name                      = "rover_on_mars"
  s.version                   = "0.0.1"
  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1")
  # According to Eric Hodel (Rubygems maintainer), you should generally not set this value
  # s.date                      = "2017-08-04"
  s.authors                   = "juanhinojo"
  s.description               = <<-DESCRIPTION.gsub(/^    /, '').chomp
    rovers
  DESCRIPTION

  s.summary                   = <<-SUMMARY.gsub(/^    /, '').chomp
    This is a gem for calculatin rovers mothing
  SUMMARY

  s.email                     = nil
  s.files                     =
    Dir['bin/**/*'] +
    Dir['lib/**/*'] +
    Dir['rake/**/*'] +
    Dir['test/**/*'] +
    %w[
      rover_on_mars.gemspec
      Rakefile
      README.markdown
    ]

  s.require_paths             = %w[lib]

  if File.directory?('bin') then
    executables = Dir.chdir('bin') { Dir.glob('**/*').select { |f| File.executable?(f) } }
    s.executables = executables unless executables.empty?
  end
  s.rubygems_version          = "1.3.1"
  s.specification_version     = 3
end
