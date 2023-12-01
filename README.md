# Eventify Event_Management_System

Eventify is a robust event management system built on the Ruby on Rails framework. It allows users to seamlessly create and manage events, enroll in active events, and provide valuable feedback through reviews. The integration of Twilio's mailing API ensures efficient communication with users by sending notifications for event creation and feedback submission.

# Key Features:
1- Devise: User Authentication.
2- Event Creation: Users can effortlessly create events with detailed information.
3- Event Enrollment: Attendees can easily enroll in any active events.
4- Feedback and Reviews: After an event concludes, attendees can share their experiences through reviews and feedback.
5- Twilio Mailing API Integration: Automated email notifications for event creation and feedback submission using Twilio's mailing API.
6- Rspec Testing: Comprehensive testing using Rspec to ensure code reliability and functionality.
7- Async Background Jobs: Utilizing Sidekiq for asynchronous background jobs, such as sending emails to users.

# Configuration

Twilio API Keys:
Obtain Twilio API keys and update the configuration in config/application.yml.

Database Configuration:
Customize database settings in config/database.yml.

Sidekiq Configuration:
Configure Sidekiq settings in config/sidekiq.yml.
