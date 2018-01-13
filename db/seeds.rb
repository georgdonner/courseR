# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Lecturer.destroy_all()
Subject.destroy_all()
Course.destroy_all()

test = User.create(email: 'test@test.de',password:'testtesttest',password_confirmation:'testtesttest', role: 'student', name: 'test user')
juleUser = User.create(email: 'jule@fink.de',password:'test',password_confirmation:'test', role: 'lecturer', name: 'Juliane Fink')

jule = Lecturer.create(title: 'Prof. Dr.', name: 'Juliane Fink', email: 'jule@fink.de')
julius = Lecturer.create(title: 'Prof.', name: 'Julius Deckert', email: 'julius@deckert.de')
marcel = Lecturer.create(title: 'Prof. Dr.', name: 'Marcel Grewe', email: 'marcel@grewe.de')
georg = Lecturer.create(title: 'Hr.', name: 'Georg Donner', email: 'georg@donner.de')

crypto = Subject.create(name: 'Cryptography', study_path: 'IMI-B', semester_info: 'AWE')
comp_sys = Subject.create(name: 'Computer Systems', study_path: 'IMI-B', semester_info: '1')
db = Subject.create(name: 'Databases', study_path: 'IMI-B', semester_info: '3')
agile = Subject.create(name: 'Agile Web Development', study_path: 'IMI-B', semester_info: 'WP')
img_proc = Subject.create(name: 'Image Processing', study_path: 'IMI-M', semester_info: 'WP')

Course.create(description: 'Insights into cryptogrphy algorithms', subject: crypto, lecturer: julius)
Course.create(description: 'Cryptography in the web', subject: crypto, lecturer: jule)
Course.create(description: 'An introduction to computer systems', subject: comp_sys, lecturer: marcel)
Course.create(description: 'Database management with SQL', subject: db, lecturer: georg)
Course.create(description: 'Agile web development with Node.js and React.', subject: agile, lecturer: georg)
Course.create(description: 'A deep dive into image processing', subject: img_proc, lecturer: marcel)
Course.create(description: 'The math behind image processing', subject: img_proc, lecturer: jule)
Course.create(description: 'Image processing fundamentals', subject: img_proc, lecturer: julius)
