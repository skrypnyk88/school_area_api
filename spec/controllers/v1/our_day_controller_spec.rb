require 'rails_helper'

RSpec.describe V1::OurDaysController, type: :controller do
  render_views
  def our_day_params(our_day)
    our_day.attributes
           .with_indifferent_access
           .extract!(:id, :description, :day)
  end

  let(:teacher) { create(:teacher) }

  let(:group) { create(:group_with_students) }

  let(:students) { group.students }

  let(:our_day) { create(:our_day, group: group, day: Date.today) }

  let(:students_attrs) do
    students.map do |student|
      student_params(student)
    end
  end

  let!(:our_day_present) do
    our_day_attrs = { our_day: our_day.attributes
                                      .with_indifferent_access
                                      .extract!(:id, :description, :day) }
    { students: students_attrs }.merge! our_day_attrs
  end

  let(:our_day_absent) do
    our_day_empty = { our_day: nil }
    { students: students_attrs }.merge! our_day_empty
  end

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(teacher)
    teacher.groups << group
  end

  describe 'GET #show' do
    context 'when any student is present' do
      before do
        report = create(:presence_report, group: group, student: students.first)
        create :report_time, reportable: report
      end

      it 'renders students and our_day report  json' do
        get :show, format: :json, params: { group_id: group, day: Date.today }
        expect(response.body).to eq(our_day_present.to_json)
      end
    end

    context 'when all students are absent' do
      it 'renders students and empty our_day report  json' do
        get :show, format: :json, params: { group_id: group, day: Date.today }
        expect(response.body).to eq(our_day_absent.to_json)
      end
    end
  end

  describe 'PUT #update' do
    context 'when our_day is valid' do
      let(:valid_params) do
        { method: :patch,
          day: Date.today,
          group_id: group,
          our_day: { description: 'Something' } }
      end

      it 'updates our_day attributes' do
        put :update, format: :json,
                     params: valid_params
        expect(our_day.reload.description)
          .to eq(valid_params[:our_day][:description])
      end

      let(:updated_our_day) do
        new_our_day = { our_day: our_day_params(our_day.reload) }
        { students: students_attrs }.merge! new_our_day
      end

      it 'renders our_day json' do
        put :update, format: :json,
                     params: valid_params

        expect(response.body).to eq(updated_our_day.to_json)
      end
    end

    context 'when our_day is not valid' do
      let(:invalid_params) do
        { method: :patch,
          day: Date.today,
          group_id: group,
          our_day: { description: 'a' * 1001 } }
      end

      it 'renders bad_reqest' do
        put :update, format: :json,
                     params: invalid_params

        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
