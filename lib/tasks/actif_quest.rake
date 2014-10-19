namespace :actif_quest do
  namespace :generate do
    desc 'Generate admin account'
    task admin: :environment do
      password = ENV['ADMIN_PASSWORD'] || 'password'
      puts 'Generate admin account...'
      Admin.create!(
        email: 'masayuki@izumin.info',
        password: password,
        password_confirmation: password
      )
    end
  end
end
