# Le Collectionist - Technical test
A Rails app that allows to consult opening hours for shops.

## Built With

* Ruby 3.1.2
* Rails 7.0.4.2
* database: PostGreSQL

## Getting Started

### 1. Install gems
  ```sh
  bundle
  ```

### 2. Initialize database
  ```sh
  rails db:create db:migrate db:seed
  ```

### 3. Launch server
  ```sh
  rails server
  ```

## Code explanation
We have 3 models : shop, slot (regular opening hours) and holiday (for exceptional hours). A shop can have many slots and many holidays. By default, a shop is closed everyday: its opening hours need to be defined with slots. A slot needs a start time and an end time, plus a weekday (0 to 6 => sunday to saturday). A holiday is used when a special occasion occurs, so it needs a date. A holiday set without a start time and end time means the shop will be closed on that date.

## Language
The app is ready to be used in French (default) and English with i18n.

## Tests
You can run tests with
  ```sh
  rails test:system
  raild test:models
  ```
