require 'rails_helper'

RSpec.describe HealthReport, type: :model do
  describe 'Validation of HealthReport' do
    before do
    @test_report_1 = HealthReport.create(health_note: "All is allright",
                                         special_care: false)
    @befor_count = HealthReport.count
    @test_report_2 = HealthReport.new(health_note: 'All is allright',
                                      special_care: false)
  end
    context 'when peport is valid' do
      it 'be valid if all value is valid' do
        @test_report_2.save
        expect(HealthReport.count).not_to be eq(@befor_count)
      end
      it 'be valid if length of health note is less then 250 char' do
        @test_report_2.health_note = 'a'*150
        expect(@test_report_2).to be_valid
      end
      it 'be valid if health be empty' do
        @test_report_2.health_note = nil
        expect(@test_report_2).to be_valid
      end
      it 'be valid if special_care = true' do
      @test_report_2.special_care = true
      expect(@test_report_2).to be_valid
      end

      it 'be valid if special_care = false' do
      @test_report_2.special_care = false
      expect(@test_report_2).to be_valid
      end
    end

    context 'when peport is invalid' do
      it 'be invalid if some value is invalid' do
        @test_report_2.special_care = nil
        expect(@test_report_2).not_to be_valid
      end
      it 'be invalid if length of health note is more then 250 char' do
        @test_report_2.health_note = 'a'*251
        expect(@test_report_2).not_to be_valid
      end
    end
  end
end
