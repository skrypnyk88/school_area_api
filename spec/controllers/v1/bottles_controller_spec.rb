require 'rails_helper'

RSpec.describe V1::BottlesController, type: :controller do
  render_views

  def bottle_data(bottle)
    bottle.attributes.extract!('id',
                               'quantity',
                               'uom',
                               'bottle_report_id')
          .merge!(time: bottle.time.strftime('%H:%M'))
  end

  let(:test_group) do
    FactoryGirl.create(:group)
  end

  let(:test_bottle_report) do
    FactoryGirl.create(:bottle_report, group_id: test_group.id)
  end

  let(:test_bottle) do
    FactoryGirl.create(:bottle, bottle_report_id: test_bottle_report.id)
  end

  before do
    allow(subject).to receive(:authenticate_user!)
  end

  describe 'GET #index' do
    context 'when return all bottles belongs to exact report' do
      it 'return all bottles for exact report' do
        test_bottles = FactoryGirl.create_list(:bottle, 10,
                                               bottle_report_id:
                                               test_bottle_report.id)
        get :index, format: :json,
                    group_id: test_group.id,
                    bottle_report_id: test_bottle_report.id

        body = test_bottles.collect { |entry| bottle_data(entry) }
                           .to_json

        expect(response.body)
          .to eq(body)
      end
    end
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
                                                 bottle_report_id:
                                                 test_bottle_report.id)
        put :update, format: :json,
                     group_id: test_group.id,
                     bottle_report_id: test_bottle_report.id,
                     id: new_bottle.id,
                     bottle: { quantity: 500,
                               time: DateTime.now,
                               uom: 'ml' }

        expect(new_bottle.reload.quantity).to be == 500
      end
    end

    context 'when bottle is updated' do
      it 'property uom is updated' do
        new_bottle = FactoryGirl.create(:bottle, quantity: 10, uom: 'oz',
                                                 bottle_report_id:
                                                 test_bottle_report.id)
        put :update, format: :json,
                     group_id: test_group.id,
                     bottle_report_id: test_bottle_report.id,
                     id: new_bottle.id,
                     bottle: { quantity: 500,
                               time: DateTime.now,
                               uom: 'ml' }

        expect(new_bottle.reload.uom).to be == 'ml'
      end
    end

    context 'when bottle is updated' do
      it 'property time is updated' do
        new_bottle = FactoryGirl.create(:bottle, quantity: 10, uom: 'oz',
                                                 bottle_report_id:
                                                 test_bottle_report.id)
        put :update, format: :json,
                     group_id: test_group.id,
                     bottle_report_id: test_bottle_report.id,
                     id: new_bottle.id,
                     bottle: { quantity: 500,
                               time: DateTime.now,
                               uom: 'ml' }

        expect(new_bottle.reload.time).to be > ((DateTime.now - 5.seconds))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when bottle is deleted' do
      it 'bottle doesn"t exist anymore' do
        existed_bottles = Bottle.find_by id: test_bottle.id

        delete :destroy, format: :json,
                         group_id: test_group.id,
                         bottle_report_id: test_bottle_report.id,
                         id: test_bottle.id

        deleted_bottle = Bottle.find_by id: test_bottle.id

        expect(existed_bottles).not_to be nil
        expect(deleted_bottle).to be nil
      end
    end
  end
end
