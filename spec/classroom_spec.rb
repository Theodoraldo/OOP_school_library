require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('Geography class') }
  let(:student) { Student.new(16, classroom, 'Peter Amawu', parent_permission: true) }

  describe 'Check initial data supplied' do
    it 'Check if initial has empty students list with label set' do
      expect(classroom.label).to eq('Geography class')
      expect(classroom.students).to eq([])
    end
  end

  describe 'If students is added successfully' do
    it 'Students array receives data' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'Provide classroom for added student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe 'If class is added successfully' do
    it 'Creates a classroom with a label' do
      classroom = Classroom.new('Physics Class')
      expect(classroom.label).to eq('Physics Class')
    end

    it 'Adds students to the classroom and sets their classroom' do
      student1 = Student.new(17, 'Post Mathematics', 'Alice')
      student2 = Student.new(18, 'Post Mathematics', 'Bob')

      classroom.add_student(student1)
      classroom.add_student(student2)

      expect(classroom.students).to include(student1, student2)
      expect(student1.classroom).to eq(classroom)
      expect(student2.classroom).to eq(classroom)
    end
  end
end
