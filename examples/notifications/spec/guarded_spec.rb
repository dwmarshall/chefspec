require 'chefspec'

describe 'notifications::guarded' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  let(:template) { chef_run.template('/tmp/notifying_resource') }

  it 'sends a notification to the service' do
    expect(template).to_not notify('service[receiving_resource]')
  end

  it 'sends the specific notification to the serivce' do
    expect(template).to_not notify('service[receiving_resource]').to(:restart)
  end
end
