class ChangeLatitudeAndLongitudeToDouble < ActiveRecord::Migration
  def change
    change_column :beacons, :latitude, :double
    change_column :beacons, :longitude, :double
  end
end
