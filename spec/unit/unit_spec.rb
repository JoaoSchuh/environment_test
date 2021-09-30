# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter', author: "JK")
  end

  # Title TESTS
  it 'is not valid without a name' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  # Author TESTS
  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  # Price TESTS
  it 'is valid without a price' do
    subject.price = nil
    expect(subject).to be_valid
  end

  it 'is not valid with negative price' do
    subject.price = -123.45
    expect(subject).not_to be_valid
  end

  it 'is not valid given a string given for price' do
    subject.price = "abcde"
    expect(subject).not_to be_valid
  end

  it 'is valid given an integer given for price' do
    subject.price = 123
    expect(subject).to be_valid
  end

  # Published date TESTS
  it 'is valid without a published date' do
    subject.published_date = nil
    expect(subject).to be_valid
  end
end
