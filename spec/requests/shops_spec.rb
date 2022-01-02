require 'rails_helper'

RSpec.describe 'Shops', type: :request do
    describe 'GET index' do
        it 'displays list of all shops' do
            rspec_shop = Shop.create!(name: 'rspec_shop1')
            get shops_url
            expect(response).to be_successful
            expect(response.body).to include(rspec_shop.name)
        end
    end

    describe 'GET show' do
        it 'renders a successful response' do
            rspec_shop = Shop.create!(name: 'rspec_shop1')
            get shop_url(rspec_shop.id)
            expect(response).to be_successful
            expect(response.body).to include(rspec_shop.name)
        end
    end

    describe 'GET new' do
        it 'renders a successful response' do
            get new_shop_url
            expect(response).to be_successful
        end
    end

    describe 'POST create' do
        context 'with valid params' do
            it 'creates a new Shop' do
                expect do
                    post shops_url, params: { shop: { name: 'rspec_shop1' } }
                end.to change(Shop, :count).by(1)
            end
        end

        context 'with invalid params' do
            it 'not create a new Shop' do
                expect do
                    post shops_url, params: { shop: { name: '' } }
                end.to change(Shop, :count).by(0)
            end
        end
    end

    describe 'GET edit' do
        it 'renders a successful response' do
            rspec_shop = Shop.create!(name: 'rspec_shop1')
            get edit_shop_url(rspec_shop.id)
            expect(response).to be_successful
            expect(response.body).to include(rspec_shop.name)
        end
    end

    describe 'PUT update' do
        context 'with valid params' do
            it 'updates the requested shop' do
                rspec_shop = Shop.create!(name: 'rspec_shop1')
                put shop_url(rspec_shop), params: { shop: { name: 'rspec_shop1_updated' } }
                expect(rspec_shop.reload.name).to eq('rspec_shop1_updated')
            end
        end

        context 'with invalid params' do
            it 'not update the requested shop' do
                rspec_shop = Shop.create!(name: 'rspec_shop1')
                put shop_url(rspec_shop), params: { shop: { name: '' } }
                expect(rspec_shop.reload.name).to eq('rspec_shop1')
            end
        end
    end

    describe 'DELETE destroy' do
        it 'deletes the requested shop' do
            rspec_shop = Shop.create!(name: 'rspec_shop1')
            expect do
                delete shop_url(rspec_shop)
            end.to change(Shop, :count).by(-1)
        end
    end
end
