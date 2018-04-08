This is a gem that can create and read data in Bloc's database by interacting with Bloc's database.

First you want to create a new instance of the class by entering your Bloc username and password. 
user = Kele.new(username, password)

You can get information about your user profile with the following code:
user.get_me

You can get a mentor's availability by with the following code:
user.get_mentor_availability(id)

You can get roadmap information with the following code:
user.get_roadmap(roadmap_id)

You can get checkpoint information with the following code:
user.get_checkpoint(checkpoint_id)

You can get your message history with the following code:
user.get_messages(page_number)

You can create a new message with the following code:
user.create_message(recipient_id, subject, body)

You can submit an assignment with the following code:
user.create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
