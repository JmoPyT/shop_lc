require 'rails_helper'

RSpec.describe Day, type: :model do
    describe '#valid' do
        context 'presence' do
            it 'should be valid' do
                rspec_day = Day.create(label: 'Monday')
                expect(rspec_day).to be_valid
            end

            it 'should be not valid' do
                rspec_day = Day.create(label: '')
                expect(rspec_day).not_to be_valid
            end
        end

        context 'uniqueness' do
            it 'should be not valid' do
                Day.create!(label: 'Monday')
                rspec_day2 = Day.create(label: 'Monday')
                expect(rspec_day2).not_to be_valid
            end
        end
    end
end
