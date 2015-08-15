namespace :portfolio do
  desc "Creates default admin user for portfolio management"
  task :create_admin_user, [:email, :password]  => :environment  do |t, args|
    puts "Creating new portfolio admin user with email #{args.email}"
    user = Portfolio::AdminUser.create email: args.email, password: args.password, password_confirmation: args.password
    unless user.valid?
      puts ">>> Error creating admin user: #{user.errors.full_messages.to_sentence}"
    end
  end
end
