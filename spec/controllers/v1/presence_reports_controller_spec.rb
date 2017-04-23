# require 'rails_helper'

# RSpec.describe V1::PresenceReportsController, type: :controller do
#   render_views
#   let!(:group) { create(:group) }
#   let!(:student) { create(:student, group: group) }
#   let!(:report) do
#     create(:presence_report, group: group, student: student)
#   end

#   before do
#     allow(subject).to receive(:authenticate_user!)
#   end

#   def presence_report_json(report)
#     {
#       id: report.id,
#       group_id: report.group_id,
#       day: report.day,
#       student_id: report.student_id
#     }.to_json
#   end

#   describe 'GET #index' do
#     it 'return all reports' do
#       get :index, format: :json,
#                   params: { group_id: group }
#       expect(response.body).to eq(PresenceReport.all.to_json)
#     end
#   end

# end
