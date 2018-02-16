namespace :import_example_users do
  task :create => [:environment] do
    User.create(first_name: 'Registered',
                last_name: 'Customer',
                address: '123 Street',
                email: 'registered_customer@example.com',
                password: 'password')

    sm = User.create(first_name: 'Store',
                     last_name: 'Manager',
                     address: '123 Street',
                     email: 'store_manager@example.com',
                     password: 'password')
    sa = User.create(first_name: 'Store',
                     last_name: 'Admin',
                     address: '123 Street',
                     email: 'store_admin@example.com',
                     password: 'password')
    pa = User.create(first_name: 'Platform',
                     last_name: 'Admin',
                     address: '123 Street',
                     email: 'platform_admin@example.com',
                     password: 'password')

    sm.roles << Role.find_by(title: 'store_manager')
    sa.roles << Role.find_by(title: 'store_admin')
    pa.roles << Role.find_by(title: 'platform_admin')

    sm.roles << sm_role
    sa.roles << sa_role
    pa.roles << pa_role
  end
end
