require 'rspec'
require 'active_record'

module DBHelpers
  def build_and_migrate_database
    create_db
    ActiveRecord::Schema.define do
      create_table :users, force: true do |t|
        t.string :name
      end
    end
  end

  def create_db
    ActiveRecord::Base.establish_connection(
      :adapter  => 'postgresql',
      :encoding => 'unicode',
      :database => 'template1'
    )
    result = ActiveRecord::Base.connection.select_all %{SELECT * FROM pg_catalog.pg_database WHERE datname = 'batcher_test'}
    unless result.size > 0
      ActiveRecord::Base.connection.execute 'CREATE DATABASE batcher_test;'
    end
  end
end

RSpec.configure do |config|
  config.include DBHelpers

  config.before(:all) do
    build_and_migrate_database
  end
end
