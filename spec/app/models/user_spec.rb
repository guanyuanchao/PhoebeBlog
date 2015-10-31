require 'rails_helper'
RSpec.describe User, :type => :model do
  context 'User module test' do
    let(:user) { User.new(email:"zhangyue@qq.com", password: "123456789", password_confirmation: "123456789") }
    it 'find method test' do
      expect(user.email).to eq("zhangyue@qq.com")
    end
  end
end