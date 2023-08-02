require_relative '../person'
require_relative '../classroom'
require_relative '../student'

RSpec.describe Student do
  let(:classroom) { Classroom.new('Science') }
  let(:student) { Student.new(16, classroom, 'John Doe') }

  describe 'Initial display of data' do
    it 'Check initial values provided' do
      expect(student.age).to eq(16)
      expect(student.classroom).to eq(classroom)
      expect(student.name).to eq('John Doe')
    end
  end

  describe 'Classroom to another classroom' do
    let(:another_classroom) { Classroom.new('Science') }
    it 'Update students classroom' do
      student.classroom = another_classroom
      expect(student.classroom).to eq(another_classroom)
      expect(classroom.students).not_to include(student)
      expect(another_classroom.students).to include(student)
    end
  end

  describe 'Student to play hooky' do
    it 'Returns a message' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
