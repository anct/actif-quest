class ChangeLatitudeAndLongitudeToDouble < ActiveRecord::Migration
  def change
    change_column :beacons, :latitude, :float, limit: 53
    change_column :beacons, :longitude, :float, limit: 53
  end
end
