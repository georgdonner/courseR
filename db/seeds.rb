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

Lecturer.create(title: 'Prof. Dr.', name: 'Juliane Fink', email: 'jule@fink.de')
Subject.create(name: 'React Fundamentals', study_path: 'IMI-B')
Course.create(description: 'Learn the fundamentals of React', subject: Subject.first, lecturer: Lecturer.first)
