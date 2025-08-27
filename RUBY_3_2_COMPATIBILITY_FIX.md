# Ruby 3.2+ Compatibility Fix

## Issue
The carmen gem v1.0.2 (used by carmen-rails) uses the deprecated `File.exists?` method which was removed in Ruby 3.2+. This causes compatibility issues when using carmen-rails with Ruby 3.2 or later versions.

## Solution
Updated the `carmen-rails.gemspec` file to change the carmen dependency from `~> 1.0.0` to `>= 1.0.0`. This allows the installation of carmen v1.1.3+, which fixes the Ruby 3.2+ compatibility issue by using `File.exist?` instead of the deprecated `File.exists?`.

## Changes Made
- Modified `carmen-rails.gemspec`: Changed `s.add_dependency "carmen", "~> 1.0.0"` to `s.add_dependency "carmen", ">= 1.0.0"`

## Verification
The fix has been tested and confirmed to work with:
- Ruby 3.3.1 
- Carmen 1.1.3
- The basic functionality of loading countries and regions works correctly

## Impact
This change allows carmen-rails to work with modern Ruby versions (3.2+) while maintaining backward compatibility with the existing API.
