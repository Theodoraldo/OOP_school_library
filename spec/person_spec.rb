require_relative '../nameable'
require_relative '../capitalize_decorator'
require_relative '../timmer_decorator'
require_relative '../person'

RSpec.describe Person do
  it 'Default values' do
    person = Person.new
    expect(person.name).to eq('Unknown')
    expect(person.age).to be_nil
  end

  it 'Custom values' do
    person = Person.new(24, 'Osei')
    expect(person.name).to eq('Osei')
    expect(person.age).to eq(24)
  end

  let(:person) { Person.new(25, parent_permission: true) }
  describe 'Can person use services?' do
    context 'when person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'Under age with parent permission' do
      let(:person) { Person.new(17, 'Paul', parent_permission: true) }
      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'Under age without parent permission' do
      let(:person) { Person.new(15, 'Frank Adu', parent_permission: false) }
      it 'returns false' do
        expect(person.can_use_services?).to eq(false)
      end
    end
  end
end
