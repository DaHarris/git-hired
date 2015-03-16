# git-hired

''''
bundle
rake db:create
rake db:migrate
''''

gitHired is a website that combines linkedin and github profiles
into a single resume page. Employers can visit your page and connect
with you over multiple social media platforms for hiring purposes!

Users are required to login to linkedin and enter a github username to
access the website. The first time a user logs in, github repos
and linkedin profile information (such as experience, skills, education,
job history, etc.) will be autofilled into the database. User can edit all
information that is pulled in. More information WILL NOT be pulled in from
linkedin on next logins. Github information WILL be pulled on EVERY login.

UI is done in foundation with custom css.

Contributors to the project:
  Daniel Harris
  Caleb Atwood
  Jessica Koch
  Alexandra Hanley
  Hayley Blackstock

Database:

  User Table:

    Name: string
    Linkedin_id: integer
    email: string
    twitter: string
    github: string
    phone: int
    bio: string

    Should be other tables?

    experience:
    skills:
    job_history:
    education:
