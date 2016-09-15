FactoryGirl.define do
  factory :book, aliases: [:ruby_microscope] do
    title "Ruby under a Microscope"
    subtitle "An illustrated guide to Ruby Internals"
    isbn_10 "1234567890"
    isbn_13 "0987654321123"
    description "Is a cool bok"
    released_on "2013-09-01"
    publisher
    author
  end
  factory :ruby_on_rails_tutorial, class: Book do
    title "Ruby on Rails tutorial"
    subtitle "Hehehe"
    isbn_10 "1234567897"
    isbn_13 "0987654321124"
    description "Is a cool bok"
    released_on "2016-09-01"
    publisher nil
    association  :author, factory: :michael_hartl

    end
end