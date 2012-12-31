# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'inspect'
  app.frameworks += ['CoreLocation', 'MapKit']
end

namespace :create do
  desc "Create Map Data"
  task :map_data do
    sh "/Library/RubyMotion/bin/ruby data/raw_map_data.rb"
  end
end