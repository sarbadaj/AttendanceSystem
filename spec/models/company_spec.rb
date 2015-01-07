require 'rails_helper'

RSpec.describe Company, :type => :model do
  it 'is invalid without a name' do
    company = Company.new(name: nil)
    expect(company).not_to be_valid
  end
end