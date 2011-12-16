require 'spec_helper'
require 'batcher'

class User < ActiveRecord::Base
end

describe Batcher do
  it 'can be set a chunk size' do
    batcher = Batcher::Process.new(stub, chunk_size: 42)
    batcher.chunk_size.should be == 42
  end

  it 'defaults to a chunk size of 1000' do
    batcher = Batcher::Process.new(stub)
    batcher.chunk_size.should be == 1000
  end

  it 'yields each object in the provided scope' do
    jimis = 3.times.map { User.create(name: 'Jimi') }
    3.times { User.create(name: 'Eric') }

    batcher = Batcher::Process.new(User.where(name: 'Jimi'), chunk_size: 2)

    yielded_objects = []
    batcher.each do |object|
      yielded_objects << object
    end

    yielded_objects.should have(3).objects
    yielded_objects.should =~ jimis
  end
end
