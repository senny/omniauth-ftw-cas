require "bundler/setup"

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'

$: << File.expand_path('../../lib', __FILE__)
require "omniauth/ftw/cas"

class OmniAuth::Ftw::TestCase < MiniTest::Unit::TestCase
end
