require_relative '../nameable'

RSpec.describe Nameable do
  let(:nameable) { Nameable.new }

  describe 'Return correct message' do
    it 'Raises NotImplementedError with the correct message' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError, 'Error raised -- correct_name.')
    end
  end
end
