guard :rspec, cmd: 'bundle exec rspec' do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  # Rails files
  rails = dsl.rails(view_extensions: %w[erb haml slim])
  dsl.watch_spec_files_for(rails.app_files)
  dsl.watch_spec_files_for(rails.views)

  watch(rails.controllers) do |m|
    "spec/requests"
  end

  # watch(rails.controllers) do |m|
  #   [
  #     rspec.spec.("routing/#{m[1]}_routing"),
  #     rspec.spec.("controllers/#{m[1]}_controller"),
  #     rspec.spec.("acceptance/#{m[1]}"),
  #     rspec.spec.("requests/#{m[1]}")
  #   ]
  # end

  # watch(rails.view_dirs)     { |m| rspec.spec.("features/#{m[1]}") }

  # Rails config changes
  watch(rails.spec_helper)     { rspec.spec_dir }
  watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
  watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

  watch('config/routes.rb')                           { 'spec/routing' }
  watch('app/controllers/application_controller.rb')  { 'spec/requests' }
end
