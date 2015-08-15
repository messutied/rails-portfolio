Portfolio.setup do |config|
  # This is displayed in the footer
  config.company_name = 'Rails Portfolio'

  # Set your custom authorization method by un-commenting the line below
  # If you don't have any authorization method in place just leave everything 
  # below commented and we'll use devise.
  # For more info see the README -> 4) Define your authorization method
  # config.auth_method = :custom

  # This action (method) will be called before enabling the user to access the portfolio admin panel, 
  # so make sure it exists and only returns true when properly authorized
  # config.auth_action = :some_other_stuff!
end
