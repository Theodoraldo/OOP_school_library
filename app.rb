require './student'
require './person'
require './teacher'
require './classroom'
require './nameable'
require './book'
require './decorator'
require './timmer_decorator'
require './capitalize_decorator'
require './rental'

class App
  def initialize(display_books = [], display_pupil = [])
    @display_books = display_books
    @display_pupil = display_pupil
  end

  def list_books
    puts 'No books available' if @display_books.empty?
    puts ' '
    @display_books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
      puts ' '
    end
  end

  def list_people
    puts 'No one has registered' if @display_pupil.empty?
    puts ' '
    @display_pupil.each do |person|
      puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      puts ' '
    end
  end

  def create_person
    puts ' '
    print 'Do you want to create a student (1) or a teacher (2)? (Input the number): '
    puts ' '
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts ' '
      print 'Option invalid, please try again'
      puts ' '
    end
  end

  def create_student
    puts ' '
    print 'Name: '
     student_name = gets.chomp
     print 'Age: '
    student_age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    has_parent_permission = gets.chomp.upcase
    case has_parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      print 'Option invalid, please try again'
      puts ' '
    end
    @display_pupil << Student.new(student_age, nil, student_name, parent_permission: parent_permission)
    puts ' '
    puts 'Student created successfully.'
    puts ' '
  end

  def create_teacher
    puts ' '
    print 'Name: '
    teacher_name = gets.chomp
    print 'Age: '
    teacher_age = gets.chomp.to_i
    print 'Specialization: '
    teacher_specialization = gets.chomp
    @display_pupil << Teacher.new(teacher_age, teacher_specialization, teacher_name)
    puts ' '
    puts 'Teacher created successfully.'
    puts ' '
  end

  def create_book
    puts ' '
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    @display_books << Book.new(book_title, book_author)
    puts ' '
    puts 'Book created successfully.'
    puts ' '
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @display_books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i
    puts ' '
    puts 'Select a person from the following list by number/index (not id)'
    puts ' '
    @display_pupil.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i
    print 'Date: '
    rental_date = gets.chomp
    if person_index >= 0 && person_index < @display_pupil.length &&
      book_index >= 0 && book_index < @display_books.length
      Rental.new(rental_date, @display_pupil[person_index], @display_books[book_index])
      puts ' '
      puts 'Rental created successfully'
      puts ' '
    else
      puts ' '
      puts 'Invalid person or book selected.'
    end
  end

  def list_rentals
    puts ' '
    @display_pupil.each do |person|
      puts "- [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    print 'ID of person: '
    person_id = gets.chomp.to_i
    person_obj = @display_pupil.find { |person| person.id == person_id }
    puts ' '
    puts 'Rentals:'
    person_obj.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
    puts ' '
  end
end
