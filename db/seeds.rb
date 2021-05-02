# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

club1 = Club.create(name: "SciFi/Fantasy Book Club", meeting_day: "Wednesdays", zoom_link: "whofahsklfnkjdffkdh")
club2 = Club.create(name: "American Classics", meeting_day: "Sundays", zoom_link: "whofsklfnkjdfahfsddsewdfskdh")
club3 = Club.create(name: "Horror", meeting_day: "Mondays", zoom_link: "whoddfdasdfsffahsklfnkjdffkdh")

user1 = User.create(username: "Laura1", email: "Laura@hotmail.com", password: "whatever")
user2 = User.create(username: "Mike", email: "Mike@hotmail.com", password: "whatever")
user3 = User.create(username: "Tom", email: "Tom@hotmail.com", password: "whatever")

book1 = Book.create(name: "War & Peace", author: "Leo Tolstoy")
book2 = Book.create(name: "Game of Thrones", author: "George RR Martin")

user3.club_users.build(club: club1, admin: true)
user3.club_users.build(club: club2, admin: true)
user3.club_users.build(club: club3, admin: true)
user3.save
club1.club_books.build(book: book1, timetable: "Finish in one month")
club1.save
