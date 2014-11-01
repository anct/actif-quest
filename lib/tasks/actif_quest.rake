
require 'csv'

MASTER_DIR = File.join(Rails.root, 'db/master').freeze
IMAGES_DIR = File.join(MASTER_DIR, 'images').freeze

def import_master(model_class, &block)
  csv_file = File.join(MASTER_DIR, "#{model_class.table_name}.csv")
  CSV.foreach(csv_file) { |row| model_class.create!(yield(row)) }
end

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

  namespace :master do
    desc 'Import master data'
    task import: :environment do
      import_master Group do |cols|
        { name: cols[0] }
      end

      import_master Bound do |cols|
        { name: cols[0] }
      end

      import_master Beacon do |cols|
        {
          uuid: cols[0], major: cols[2], minor: cols[3],
          bound: Bound.find_by(name: cols[1])
        }
      end

      import_master Exhibition do |cols|
        image_file = File.join(IMAGES_DIR, Exhibition.table_name, cols[3])
        {
          name: cols[0],
          bound: Bound.find_by(name: cols[1]),
          group: Group.find_by(name: cols[2]),
          image_url: File.open(image_file)
        }
      end

      import_master Treasure do |cols|
        image_file = File.join(IMAGES_DIR, Treasure.table_name, cols[2])
        {
          name: cols[0], description: cols[1], bound: Bound.find_by(name: cols[3]),
          image_url: File.open(image_file)
        }
      end
    end
  end
end
