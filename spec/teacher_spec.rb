require_relative '../person'
require_relative '../teacher'

RSpec.describe Teacher do
  describe 'Teacher data initialization' do
    it 'Setting the age, name, and specialization' do
      teacher = Teacher.new(35, 'Computer Engineering')
      expect(teacher.age).to eq(35)
      expect(teacher.name).to eq('Unknown')
      expect(teacher.instance_variable_get(:@specialization)).to eq('Computer Engineering')
    end

    it 'Teacher information when set by user' do
      teacher = Teacher.new(35, 'Spanish', 'Venkat April')
      expect(teacher.name).to eq('Venkat April')
      expect(teacher.age).to eq(35)
    end

    it 'When name is not provided' do
      teacher = Teacher.new(30, 'Physics')
      expect(teacher.name).to eq('Unknown')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new(45, 'History')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
