# Rail Station
### Author: Adge Denkers

Rail station is a base rails app using SQLite3, Devise, Aegis among other gems. Use and modify to meet your needs.


# How Rail Station was created

## Create Rails App


	$ rails new rail-station --skip-testunit
	$ cd rail-station


## Edit Gemfile
	$ mate Gemfile

### Replace Gemfile contents with the code below

	source 'http://rubygems.org'

	gem 'rails', '3.0.3'

	gem 'sqlite3-ruby', :require => 'sqlite3'

	gem 'haml'
	gem 'compass', '>= 0.10.3'
	gem 'warden'
	gem 'devise'

	gem 'aegis'

	# devise needs these if you are using HAML 10.8.10
	gem 'hpricot'
	gem 'ruby_parser'

	group :development do
	  gem 'rspec-rails', '>= 2.0.0.beta.1' # have to do this so rake spec works...
	  gem 'annotate-models', '1.0.4'
	end

	group :test do
	  gem 'factory_girl_rails'
	  gem 'autotest'
	  gem 'capybara'
	  gem 'database_cleaner'
	  gem 'cucumber-rails'
	  gem 'cucumber'
	  gem 'spork'
	  gem 'launchy'
	  gem 'webrat'
	end


## Install the Gems
	$ bundle install

## Commit to git

	$ git add .
	$ git commit -am "updated gems"


## Install Devise
	$ rails g devise:install

## Commit to git

	$ git add .
	$ git commit -am "installed devise"


### Create new Github repository: https://github.com/repositories/new 

	$ git remote add origin git@github.com:adgedenkers/rail-station.git
	$ git push origin master 


## Install RSpec
	$ rails g rspec:install

## Create new git branch to work with
	$ git co -b initial-controllers

## Create Initial Controllers
	$ rails g controller Pages home contact about help

## Configure routes.rb
	$ mate config/routes.rb

	# Add the following line to routes.rb
	root :to => "pages#home"


## Cleanup 
	$ git mv public/index.html public/original-index.html

## Setup Devise
### Create "User" model 
	$ rails g devise User
	$ rake db:migrate


## Edit views/layouts/application.html.erb
## -- replace 
	<%= yield %>

## -- with
	<div id="container" class="container">
		<div id="user_nav">
			<% if user_signed_in? %> 
				Signed in as <%= current_user.email %>. Not you? 
				<%= link_to "Sign out", destroy_user_session_path %>
			<% else %>
				<%= link_to "Sign up", new_user_registration_path %> or 
				<%= link_to "Sign in", new_user_session_path %>.
			<% end %>
		</div>
	
		<% flash.each do |name, msg| %>
		<%= content_tag :div, msg, :id => "flash_#{name}" %>
		<% end %>

		<%= yield %>

	</div> <!-- end id=container -->
























