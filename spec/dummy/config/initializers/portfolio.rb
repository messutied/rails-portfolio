Portfolio.setup do |config|
  # This is displayed in the footer
  config.company_name = 'Rails Portfolio'

  # Set your custom authorization method by un-commenting the two lines below
  
  # config.auth_method = :custom
  # config.auth_action = :my_auth_action!
  
  # If you don't have any authorization method in place, leave the lines above 
  # commented and we'll use devise.
  # For more info see the README -> 4) Define your authorization method
  
  # :my_auth_action! is the method that will be called before enabling the user 
  # to access the portfolio admin panel, 
  # so make sure it exists and only returns true when properly authorized
  
  
end
