namespace :roles do
  task :create => [:environment] do
    ROLES = ["registered_user", "store_manager", "store_admin", "platform_admin"]
    ROLES.each do |role|
      Role.create(title: role)
      puts "created #{role}"
    end
    User.all.each do |user|
      user.roles << Role.find_by(title: "registered_user")
    end
  end
end
