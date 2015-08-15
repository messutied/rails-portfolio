require 'test_helper'
require 'generators/portfolio_install/portfolio_install_generator'

module Portfolio
  class PortfolioInstallGeneratorTest < Rails::Generators::TestCase
    tests PortfolioInstallGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
