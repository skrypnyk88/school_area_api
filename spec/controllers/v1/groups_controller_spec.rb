require 'rails_helper'

RSpec.describe V1::GroupsController, type: :controller do
  render_views
  let!(:group) { create(:group) }
  let(:current_user) { create(:teacher) }
  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
    current_user.groups << group
  end

  def group_json(group)
    {
      id: group.id,
      name: group.name
    }.to_json
  end

  def group_params(group)
    group.attributes.extract!(:name)
  end

  describe "returns only current user's groups" do
    let!(:group_2) { create(:group) }
    it 'is not valid' do
      expect(response.body).to_not include(group_json(group_2))
    end
  end

  describe 'GET #index' do
    it 'return all groups' do
      get :index, format: :json
      expect(response.body).to include(group_json(group))
    end
  end

  describe 'POST #create' do
    context 'when group is valid' do
      it 'creates group' do
        post :create,
             format: :json,
             params: {
               id: group,
               group: { name: 'Sun' }
             }
        expect(Group.find_by(name: 'Sun')).to be_present
      end
    end
    context 'when group is not valid' do
      it 'renders bad_request response' do
        post :create,
             format: :json,
             params: {
               id: group,
               group: { name: '`a`' }
             }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when group is valid' do
      let(:valid_params) do
        { method: :patch,
          id: group,
          group: { name: 'Sun' } }
      end

      it 'updates groups attributes' do
        post :update, format: :json,
                      params: valid_params
        expect(group.reload.name)
          .to eq(valid_params[:group][:name])
      end

      it 'renders group json' do
        post :update, format: :json,
                      params: valid_params
        expect(response.body).to eq(group_json(group.reload))
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:delete_params) { { method: :delete, id: group } }

    it 'deletes groups' do
      post :destroy,
           format: :json,
           params: delete_params
      expect(Group.exists?(group.id)).to be false
    end

    it 'renders ok response' do
      post :destroy,
           format: :json,
           params: delete_params
      expect(response).to have_http_status(:no_content)
    end
  end
end
