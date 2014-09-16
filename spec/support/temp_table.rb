module TempTable
  def create_temp_table(name, &block)
    before do
      m = ActiveRecord::Migration.new
      m.verbose = false
      m.create_table name, &block
    end

    after do
      m = ActiveRecord::Migration.new
      m.verbose = false
      m.drop_table name
    end
  end
end

RSpec.configure do |config|
  config.extend TempTable
end
