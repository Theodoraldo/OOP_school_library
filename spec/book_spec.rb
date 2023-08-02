require_relative '../book'

RSpec.describe Book do
  it 'Propoerly constructed getters and setters' do
    book = Book.new('Titanic', 'James Cameron')
    expect(book.title).to eq('Titanic')
    expect(book.author).to eq('James Cameron')
  end
end
