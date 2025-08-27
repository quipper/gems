#!/usr/bin/env ruby

# Test script to verify carmen 1.1.3 compatibility with Ruby 3.2+
# This script demonstrates that the File.exists? issue has been fixed

require 'bundler/setup'
require 'carmen'

puts "Carmen version: #{Carmen::VERSION rescue 'unable to determine'}"
puts "Ruby version: #{RUBY_VERSION}"

# Test basic Carmen functionality
begin
  # This would fail with older carmen versions on Ruby 3.2+ due to File.exists?
  countries = Carmen::Country.all
  puts "Successfully loaded #{countries.length} countries"

  # Test a specific country
  us = Carmen::Country.coded('US')
  if us
    puts "Found USA: #{us.name}"
    states = us.subregions
    puts "USA has #{states.length} states/regions"
  else
    puts "Could not find USA"
  end

  puts "Carmen gem is working correctly with Ruby #{RUBY_VERSION}"
rescue => e
  puts "Error: #{e.message}"
  puts e.backtrace.first(3)
end
