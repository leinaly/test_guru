# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{title: 'Frontend'},{title: 'Backend'},{title: 'Movie Development'}])
users      = User.create([{name: "User1", password: "pass1", type: ""}, {name: "User2", password: "pass2", type: ""}])
tests      = Test.create([{title: "HTML", level: 1, category_id: 3}, {title: "Go", level: 2, category_id: 1}, {title: "Ruby", level: 2, category_id: 2},
                          {title: "Java", level: 2, category_id: 2}, {title: "JS", level: 3, category_id: 1}, {title: "Python", level: 1, category_id: 2}]) questions  = Question.create([{body: "Test ruby question 1", test_id: 3}, {body: "Test ruby question 2", test_id: 3},
                              {body: "Test html question 1",test_id: 1}, {body: "Test go question 1",test_id: 2}, {body: "Test go question 2",test_id: 2}])
answers    = Answer.create([{body: "Test ruby answer 1", question_id: 1, correct: false}, {body: "Test ruby answer 2",  question_id: 1, correct: true},
                            {body: "Test html answer 1",  question_id: 3, correct: true}, {body: "Test htnl answer 2", question_id: 3, correct: false},
                            {body: "Test go answer 1", question_id: 4, correct: false}, {body: "Test go answer 2", question_id: 4, correct: true}])
tests_users = TestsUser.create([{user_id: 1, test_id: 1}, {user_id: 2, test_id: 2}])

