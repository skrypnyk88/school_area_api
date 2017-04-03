require 'rails_helper'

RSpec.describe V1::HealthReportsController, type: :routing do
  it 'routes GET/health_reports to HealthReportsController#show' do

    expect(get: '/v1/health_reports/1.json').
    to route_to(controller: 'v1/health_reports', action: 'show' , "id"=>"1", "format"=>"json")
  end

  it 'routes GET/health_reports to HealthReportsController#index' do

    expect(get: '/v1/health_reports').
    to route_to(controller: 'v1/health_reports', action: 'index')
  end

  it 'routes POST/health_reports to HealthReportsController#create' do

    expect(post: '/v1/health_reports').
    to route_to(controller: 'v1/health_reports', action: 'create')
  end

  # it 'routes PUT/health_reports to HealthReportsController#update' do

  #   expect(put: '/v1/health_reports').
  #   to route_to(controller: 'v1/health_reports', action: 'update')
  # end

  it 'routes GET/health_reports to HealthReportsController#patch' do

    expect(get: '/v1/health_reports').
    not_to route_to(controller: 'v1/health_reports', action: 'patch')
  end
end
