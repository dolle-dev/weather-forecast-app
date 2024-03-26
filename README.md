# Weather Forecast App

## Introduction

The Weather Forecast App is a Ruby on Rails application designed to retrieve weather forecast data based on user-provided addresses. It allows users to input an address, retrieves forecast data for the specified location, and displays the forecast details, including current temperature and optional high/low and extended forecast information.

## Installation

### Ruby Version

This application requires Ruby version 3.1.2

### System Dependencies

Make sure you have the following dependencies installed on your system:
- Ruby on Rails 6.1.7
- PostgreSQL 14(database)

### Configuration

1. Clone the repository:

   ```bash
   git clone <repository-url>

2. Install dependencies:
    run `bundle install`

3. Configure the database:
    Update `config/database.yml` with your PostgreSQL credentials.

### Database Setup
Create the PostgreSQL database:
    `rails db:create`
Initialize the database schema:
    `rails db:migrate`

### Usage
To run the application locally, start the Rails server:
    `rails server`

### Testing
This project uses RSpec for testing. Run the following command to execute the test suite:
    `rspec`

### Deployment
To deploy the application, follow the standard Rails deployment process for your chosen hosting platform.

### Contributing
Contributions are welcome! If you'd like to contribute to the project, please submit a pull request.

### License
This project is licensed under the MIT License.
