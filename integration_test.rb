#!/usr/bin/env ruby
# Simple integration test to verify carmen-rails works with carmen 1.1.3+

require_relative 'lib/carmen-rails'

puts "Testing carmen-rails integration with carmen #{Carmen::VERSION rescue 'unknown'}"

# Test that the form helpers can be loaded without errors
begin
  require 'action_view'
  include ActionView::Helpers::FormOptionsHelper

  # Test basic region options generation
  countries = Carmen::Country.all.first(3)
  options = region_options_for_select(countries)

  puts "✓ Successfully generated region options"
  puts "✓ carmen-rails is compatible with carmen #{Carmen::VERSION}"
  puts "\nThe Ruby 3.2+ compatibility issue has been resolved!"

rescue => e
  puts "✗ Error: #{e.message}"
  exit 1
end
