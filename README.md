# Project Setup
- Clone project source
- Config database: Create `config/database.yml` (base on `config/database.example.yml`)
- Config application: Create `config/application.yml` (base on `config/application.example.yml`)
- Install gem:
    ```
    gem install bundler
    bundle install
    ```
- Install yarn:
    ```
    yarn install
    ```
- Init database:
    ```
    rake db:create
    rake db:migrate
    rake db:seed
    ```
- Start server:
    ```
    bin/webpack-dev-server
    rails s
    ```
