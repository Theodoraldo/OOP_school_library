require_relative '../capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  it 'Capitalize name' do
    nameable = double('nameable')
    allow(nameable).to receive(:correct_name).and_return('theodore asimeng-osei')
    decorator = CapitalizeDecorator.new(nameable)
    expect(decorator.correct_name).to eq('Theodore asimeng-osei')
  end
end
