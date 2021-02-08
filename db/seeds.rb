# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Category.create(title: 'Frontend')
cat2 = Category.create(title: 'Backend')
cat3 = Category.create(title: 'Movie Development')

us1 = User.create(name: "User1", password: "pass1", type: "")
us2 = User.create(name: "User2", password: "pass2", type: "")

t1 = Test.create(title: "HTML", level: 1, category_id: cat3.id)
t2 = Test.create(title: "Go", level: 2, category_id: cat1.id)
t3 = Test.create(title: "Ruby", level: 2, category_id: cat2.id)
t4 = Test.create(title: "Java", level: 2, category_id: cat2.id)
t5 = Test.create(title: "JS", level: 3, category_id: cat1.id)
t6 = Test.create(title: "Python", level: 1, category_id: cat2.id)

q1 = Question.create(body: "Test ruby question 1", test_id: t3.id)
q2 = Question.create(body: "Test ruby question 2", test_id: t3.id)
q3 = Question.create(body: "Test html question 1",test_id: t1.id)
q4 = Question.create(body: "Test go question 1",test_id: t2.id)
q5 = Question.create(body: "Test go question 2",test_id: t2.id)

an1 = AnswerOld.create(body: "Test ruby answer 1", question_id: q1.id, correct: false)
an2 = AnswerOld.create(body: "Test ruby answer 2", question_id: q1.id, correct: true)
an3 = AnswerOld.create(body: "Test html answer 1", question_id: q3.id, correct: true)
an4 = AnswerOld.create(body: "Test htnl answer 2", question_id: q3.id, correct: false)
an5 = AnswerOld.create(body: "Test go answer 1", question_id: q4.id, correct: false)
an6 = AnswerOld.create(body: "Test go answer 2", question_id: q4.id, correct: true)

t_u1 = TestsUser.create(user_id: us1.id, test_id: t1.id)
t_u2 = TestsUser.create(user_id: us2.id, test_id: t2.id)





