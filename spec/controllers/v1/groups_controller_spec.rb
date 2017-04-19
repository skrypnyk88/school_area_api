require 'rails_helper'

RSpec.describe V1::GroupsController, type: :controller do
  render_views

  let(:current_user) do
    create(:teacher)
  end

  let!(:current_user_groups) do
    current_user.groups << create_list(:group, 2)
    current_user.groups.map do |g|
      g.attributes.with_indifferent_access.extract!(:id, :name)
    end.to_json
  end

  before do
    allow(subject).to receive(:authenticate_user!)
    allow(subject).to receive(:current_user).and_return(current_user)
  end

  describe 'GET #index' do
    let!(:not_current_user_groups) do
      group = create(:group)
      group.attributes.with_indifferent_access.extract!(:id, :name).to_json
    end

    it "includes current user's group" do
      get :index, format: :json
      expect(response.body).to eq(current_user_groups)
    end

    it "doesn't include not current user's group" do
      get :index, format: :json
      expect(response.body).to_not eq(not_current_user_groups)
    end
  end
end
