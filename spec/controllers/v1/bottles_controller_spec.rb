require 'rails_helper'

RSpec.describe V1::BottlesController, type: :controller do
  render_views

  let(:test_group) { FactoryGirl.create(:group) }
  let(:test_bottle_report) { FactoryGirl.create(:bottle_report,                                             group_id: test_group.id) }
  let(:test_bottle) { FactoryGirl.create(:bottle,
                                         bottle_report_id: test_bottle_report.id) }
  before do
    allow(subject).to receive(:authenticate_user!)
  end

  describe 'POST #create' do
    context 'when bottle is created' do
      it 'create a new bottle' do
        post :create, format: :json,
                      bottle_report_day: test_bottle_report.day,
                      bottle_report_id: test_bottle_report.id,
                      group_id: test_group.id

        expect(JSON.parse(response.body)['id']).to be > 0
      end
    end
  end

  describe 'PUT #update' do
    context 'when bottle is updated' do
      it 'property quantity is updated' do
        new_bottle = FactoryGirl.create(:bottle, quantity: 10, uom: 'oz',
                                        bottle_report_id: test_bottle_report.id)
        put :update, format: :json,
                     bottle_report_day: test_bottle_report.day,
                     id: new_bottle.id,
                     bottle: { quantity: 500,
                               time: DateTime.now,
                               uom: 'ml' }
        updated_bottle = Bottle.find_by id: new_bottle.id

        expect(updated_bottle.quantity).to be == 500
      end
    end

    context 'when bottle is updated' do
      it 'property uom is updated' do
        new_bottle = FactoryGirl.create(:bottle, quantity: 10, uom: 'oz',
                                        bottle_report_id: test_bottle_report.id)
        put :update, format: :json,
                     bottle_report_day: test_bottle_report.day,
                     id: new_bottle.id,
                     bottle: { quantity: 500,
                               time: DateTime.now,
                               uom: 'ml' }
        updated_bottle = Bottle.find_by id: new_bottle.id

        expect(updated_bottle.uom).to be == 'ml'
      end
    end

    context 'when bottle is updated' do
      it 'property time is updated' do
        new_bottle = FactoryGirl.create(:bottle, quantity: 10, uom: 'oz',
                                        bottle_report_id: test_bottle_report.id)
        put :update, format: :json,
                     bottle_report_day: test_bottle_report.day,
                     id: new_bottle.id,
                     bottle: { quantity: 500,
                               time: DateTime.now,
                               uom: 'ml' }
        updated_bottle = Bottle.find_by id: new_bottle.id

        expect(updated_bottle.time).to be > ((DateTime.now - 5.seconds))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when bottle is deleted' do
      it 'bottle doesn"t exist anymore' do
        existed_bottles = Bottle.find_by id: test_bottle.id

        delete :destroy, format: :json,
                         bottle_report_day: test_bottle_report.day,
                         id: test_bottle.id

        deleted_bottle = Bottle.find_by id: test_bottle.id

        expect(existed_bottles).not_to be nil
        expect(deleted_bottle).to be nil
      end
    end
  end
end
