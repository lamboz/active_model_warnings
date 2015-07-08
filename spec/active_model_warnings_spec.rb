require 'spec_helper'

describe ActiveModelWarnings::Compliance do
  context 'an ActiveModel resource' do
    before do
      @resource = Resource.new('password')
    end

    it 'should respond to compliant?' do
      expect(@resource).to respond_to(:compliant?)
    end

    it 'should respond to warnings' do
      expect(@resource).to respond_to(:warnings)
    end
  end

  context 'a compliant resource' do
    before do
      @resource = Resource.new('secure_password')
    end

    it 'should be compliant' do
      compliant = @resource.compliant?
      expect(compliant).to be true
    end

    it 'should be valid' do
      expect(@resource).to be_valid
    end
  end

  context 'a non compliant but valid resource' do
    before do
      @resource = Resource.new('poor')
    end

    it 'should not be compliant' do
      compliant = @resource.compliant?
      expect(compliant).to be false
    end

    it 'should be valid' do
      expect(@resource).to be_valid
    end

    it 'should contain one warning' do
      @resource.compliant?
      expect(@resource.warnings.size).to eq(1)
    end
  end

  context 'an invalid resource' do
    before do
      @resource = Resource.new('')
    end

    it 'should not be compliant' do
      compliant = @resource.compliant?
      expect(compliant).to be false
    end

    it 'should not be valid' do
      expect(@resource).to_not be_valid
    end
  end
end
