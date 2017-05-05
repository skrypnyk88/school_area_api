require 'rails_helper'

RSpec.describe V1::BottlesController, type: :controller do
  render_views

  let(:current_user) { create(:teacher) }

  let!(:current_user_groups) do
    current_user.groups << test_group
  end

  let(:test_group) do
    create(:group)
  end

  let(:test_bottle_report) do
    create(:bottle_report, group_id: test_group.id)
  end

  let(:test_bottle) do
    create(:bottle, bottle_report_id: test_bottle_report.id)
  end

  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  describe 'POST #create' do
    context 'when bottle is created' do
      it 'create a new bottle' do
        post :create, format: :json,
                      params: { bottle_report_day: test_bottle_report.day,
                                bottle_report_id: test_bottle_report.id,
                                group_id: test_group.id }

        expect(Bottle.exists?(id: test_bottle.id)).to be true
      end
    end
  end

  describe 'PUT #update' do
    context 'when bottle is updated' do
      it 'property time is updated' do
          put :update, format: :json,
                       params: { group_id: test_group.id,
                                 bottle_report_id: test_bottle_report.id,
                                 id: test_bottle.id,
                                 bottle: { quantity: 100 } }

          expect(test_bottle.reload.quantity).to eq(100)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when bottle is deleted' do
      it 'bottle doesn"t exist anymore' do
        delete :destroy, format: :json,
                         params: { group_id: test_group.id,
                                   bottle_report_id: test_bottle_report.id,
                                   id: test_bottle.id }

        expect(Bottle.exists?(id: test_bottle.id)).to be false
      end
    end
  end
end
