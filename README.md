# IMI CourseR

Look for IMI courses and see how other people liked them.

## Docker

- **Terminal 1:** Start the containers with `docker-compose up`.
- **Terminal 2:** Run `docker-compose run web rails db:create && docker-compose run web rails db:migrate && docker-compose run web rails db:seed` to set up the database.
- **Terminal 2:** To shut docker down, run `docker-compose down`.