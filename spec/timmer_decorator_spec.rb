require_relative '../decorator'
require_relative '../timmer_decorator'

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('nameable', correct_name: 'Theodore Asimeng-Osei') }
  let(:trimmer_decorator) { TrimmerDecorator.new(nameable) }

  describe 'Check Fullname and First name' do
    context 'when the name is longer than 10 characters' do
      it 'returns the first 10 characters of the name' do
        expect(trimmer_decorator.correct_name).to eq('Theodore A')
      end
    end

    context 'when name is less than 10 characters' do
      let(:nameable) { double('nameable', correct_name: 'Theodore') }
      it 'Return name as it appears' do
        expect(trimmer_decorator.correct_name).to eq('Theodore')
      end
    end
  end
end
