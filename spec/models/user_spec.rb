require 'rails_helper'

describe User, type: :model do
  context 'Validations' do
    it { should have_many :plays }
  end
end
