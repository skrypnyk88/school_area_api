require 'rails_helper'

RSpec.describe V1::BottleReportsController, type: :controller do
  render_views

  def bottle_report_data(bottle_report)
    bottle_report.attributes.with_indifferent_access.extract!(:id,
                                      :day,
                                      :group_id)
                 .merge!(student: bottle_report.student
                 .attributes.with_indifferent_access.extract!(:id,
                                      :first_name,
                                      :last_name))
                 .merge!(bottles: [])
  end

  let!(:group_1) { FactoryGirl.create(:group) }

  let!(:group_2) { FactoryGirl.create(:group) }

  let!(:student_1) {  FactoryGirl.create(:student, group_id: group_1.id) }

  let!(:student_2) {  FactoryGirl.create(:student, group_id: group_1.id) }

  let!(:student_3) {  FactoryGirl.create(:student, group_id: group_2.id) }

let!(:bottle_report_1) {FactoryGirl.create_list(:bottle_report,1,
                                                      student_id: student_1.id,
                                                      group_id: group_1.id,
                                                      day: DateTime.now)}
let!(:bottle_report_2) {FactoryGirl.create_list(:bottle_report,1,
                                                      student_id: student_2.id,
                                                      group_id: group_1.id,
                                                      day: DateTime.now)}
let!(:bottle_report_3) {FactoryGirl.create_list(:bottle_report,1,
                                                      student_id: student_3.id,
                                                      group_id: group_2.id,
                                                      day: DateTime.now)}

  before do
    allow(subject).to receive(:authenticate_user!)
  end

  describe 'GET #index' do
    context 'when search for all bottle reports by group' do
      it 'return all bottle reports for exact group' do
        get :index, format: :json,
                    group_id: group_1.id

        body = bottle_report_1.concat(bottle_report_2).collect { |entry| bottle_report_data(entry) }.to_json

        expect(response.body)
          .to eq(body)
      end
    end
  end
end
