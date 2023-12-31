# Eventify Event_Management_System

Eventify is a robust event management system built on the Ruby on Rails framework. It allows users to seamlessly create and manage events, enroll in active events, and provide valuable feedback through reviews. The integration of Twilio's mailing API ensures efficient communication with users by sending notifications for event creation and feedback submission.

## Key Features:
* Authentication
  * Devise:  User Authentication.
* Event Management
  * Event Creation: Users can effortlessly create events with detailed information.
  * Event Enrollment: Attendees can easily enroll in any active events.
  * Feedback and Reviews: After an event concludes, attendees can share their experiences through reviews and feedback.
* Integration
  * Twilio Mailing API Integration: Automated email notifications for event creation and feedback submission using Twilio's mailing API.
* Testing
  * Rspec Testing: Comprehensive testing using Rspec to ensure code reliability and functionality.
* Background Jobs
  * Sidekiq: Utilizing Sidekiq for asynchronous background jobs, such as sending emails to users.
* Gems
  * Devise
  * will_paginate
  * Ransack
  * Redis
  * Sendgrid

## Configuration

Twilio API Keys:
Obtain Twilio API keys and update the configuration in config/application.yml.

Database Configuration:
Customize database settings in config/database.yml.

Sidekiq Configuration:
Configure Sidekiq settings in config/sidekiq.yml.
