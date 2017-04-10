require 'rails_helper'

RSpec.describe V1::BottleReportsController, type: :controller do
  render_views

  def bottle_report_json(bottle_report)
    bottle_report_json = {'id'=> bottle_report.id,
      'day'=> bottle_report.day.to_s,
      'group_id' => bottle_report.group_id,
      'student_id' => bottle_report.student_id,
      'bottles'=> bottle_report.bottles.map{|b| {'id' => b.id,
                                                 'quantity' => b.quantity,
                                                 'time' => b.time.to_s,
                                                 'uom' => b.uom,
                                                 'bottle_report_id' => b.bottle_report_id}}
                                                }
  end

  let(:test_group) { FactoryGirl.create(:group) }

  before do
    allow(subject).to receive(:authenticate_user!)
  end

  describe 'GET #index' do
    context 'when search for all bottle reports by group' do
      it 'return all bottle reports for exact group' do
        test_bottle_reports = FactoryGirl.create_list(:bottle_report, 10,
                                                      group_id: test_group.id)
        get :index, format: :json, group_id: test_group.id

        expect(JSON.parse(response.body))
        .to eq(test_bottle_reports.collect{|entry| bottle_report_json(entry)})
      end
    end

    context 'when search for all bottle reports by day and group' do
      it 'return all bottle reports for exact day and group' do
        test_bottle_reports = FactoryGirl.create_list(:bottle_report, 10,
                                                      group_id:
                                                      test_group.id,
                                                      day: DateTime.now)
        get :index, format: :json, group_id: test_group.id,
                             day: DateTime.now

        expect(JSON.parse(response.body))
        .to eq(test_bottle_reports.collect{|entry| bottle_report_json(entry)})
      end
    end
  end
end
