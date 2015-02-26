# PubMedApps #

The spiffiest site for PubMedApps.

## Running the tests ##

Spring is working now, so instead of using `bundle exec rspec` or
`bundle exec cucumber`, use

	bin/spring rspec

or

	bin/spring cucumber

It might be nice to set `rake` up to do this automagically.

### With Guard ###

Guard is now setup to watch for Cucumber features and RSpec specs.
