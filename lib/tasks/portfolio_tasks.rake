# desc "Explaining what the task does"
# task :portfolio do
#   # Task goes here
# end
namespace :portfolio do
  desc "Creates default admin user for portfolio management"
  task :create_admin_user, [:email, :password]  => :environment  do |t, args|
    # args.with_defaults(:email => "Thanks for logging on")
    # puts "Hello #{User.first.name}. #{args.message}"   # Q&A above had a typo here : #{:message}
    puts "Creating new portfolio admin user with email #{args.email}"
    Portfolio::AdminUser.create email: args.email, password: args.password, password_confirmation: args.password
  end
end
