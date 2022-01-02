require 'rails_helper'

RSpec.describe Shop, type: :model do
    describe '#valid' do
        context 'presence' do
            it 'should be valid' do
                rspec_shop = Shop.create(name: 'rspec_shop1')
                expect(rspec_shop).to be_valid
            end

            it 'should be not valid' do
                rspec_shop = Shop.create(name: '')
                expect(rspec_shop).not_to be_valid
            end
        end

        context 'uniqueness' do
            it 'should be not valid' do
                Shop.create!(name: 'rspec_shop1')
                rspec_shop2 = Shop.create(name: 'rspec_shop1')
                expect(rspec_shop2).not_to be_valid
            end
        end
    end
end
