spec = Gem::Specification.new do |s|
  s.name = 'rails_application_assets'
  s.version = '1.0.2'
  s.summary = "Shared assets for Rails."
  s.description = "Make rails asset tag helpers (image_tag, javascript_include_tag etc.) aware for shared environment."
  s.files = Dir['lib/**/*.rb']
  s.require_path = 'lib'
  s.author = "Peter Ehrenberg"
  s.email = "pe@dipe.de"
  s.homepage = "https://github.com/dipe/rails_application_assets"
end
