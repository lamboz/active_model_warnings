require 'spec_helper'

describe ActiveModelWarnings::Compliance do

  shared_examples 'a compliant resource' do
    it 'should respond to compliant?' do
      expect(resource).to respond_to(:compliant?)
    end

    it 'should respond to warnings' do
      expect(resource).to respond_to(:warnings)
    end

    it 'should be compliant' do
      expect(resource.compliant?).to be true
    end

    it 'should be valid' do
      expect(resource).to be_valid
    end
  end

  shared_examples 'a noncompliant resource' do
    it 'should not be compliant' do
      compliant = resource.compliant?
      expect(compliant).to be false
    end

    it 'should be valid' do
      expect(resource).to be_valid
    end

    it 'should contain one warning' do
      resource.compliant?
      expect(resource.warnings.size).to eq(1)
    end
  end

  shared_examples 'an invalid resource' do
    it 'should not be compliant' do
      expect(resource.compliant?).to be false
    end

    it 'should not be valid' do
      expect(resource).to_not be_valid
    end
  end

  context 'an ActiveModel resource' do
    it_behaves_like 'a compliant resource' do
      let(:resource) { Resource.new('secure_password') }
    end

    it_behaves_like 'a noncompliant resource' do
      let(:resource) { Resource.new('weak') }
    end

    it_behaves_like 'an invalid resource' do
      let(:resource) { Resource.new('') }
    end
  end

  context 'an ActiveRecord resource' do
    it_behaves_like 'a compliant resource' do
      let(:resource) { User.new(:password => 'secure_password') }
    end

    it_behaves_like 'a noncompliant resource' do
      let(:resource) { User.new(:password => 'weak') }
    end

    it_behaves_like 'an invalid resource' do
      let(:resource) { User.new(:password => '') }
    end
  end
end
