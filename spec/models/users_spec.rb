require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#humanize' do
    let(:first_user) { create(:user) }
    it 'gets correct user name and password' do
      expect(first_user.humanize).to eq(
        first_user.name + ' ' + first_user.surname
      )
    end

    it 'encrypts the password' do
      expect(first_user.encrypted_password).to_not eq('password')
    end
  end
end
