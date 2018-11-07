# :movie_camera: VIEWPOINT
[![Build Status](https://travis-ci.org/emmiehayes/view_point.svg?branch=master)](https://travis-ci.org/emmiehayes/view_point)

## Table of Contents
- [Purpose](#Purpose)
- [LiveApp](#LiveApp)
- [Views](#Views)
- [Extensions](#Extensions)
- [Requirements](#Requirements)
- [Technologies](#Technologies)
- [Testing](#Testing)

## Purpose
The purpose of this application is to provide outdoor movie watchers with movie suggestions based on the movies they've enjoyed in the past as well as a weather forecast to support planning.  Recommendations will be supplied by the TasteDive API and the 7-day forecast provided by the APIXU weather API.

## LiveApp
[VIEWPOINT](https://pure-caverns-53726.herokuapp.com/ "VIEWPOINT")

## Views
<img alt="root" src="https://cl.ly/570e86fb9ee1/Screen%20Shot%202018-11-06%20at%207.01.24%20PM.jpg">
<img alt="search-form" src="https://cl.ly/9bc8d2fd36d2/Screen%20Shot%202018-11-06%20at%206.58.07%20PM.jpg">
<img alt="results" src="https://cl.ly/8b44188efe9d/Screen%20Shot%202018-11-06%20at%206.57.42%20PM.jpg">

## Extensions
  Future iterations include sending a text to your friends to invite them to movie night.

## Requirements
[Project Spec](http://backend.turing.io/module4/projects/take_home_challenge/take_home_challenge_spec "Project Spec")

#### Take Home Challenge:
```
Use the TasteDive API to create a recommendations app based on users preferences.
```

## Technologies
- Language: ruby 2.4.1p111
- Framework: Rails 5.1.6
- Tools: TasteDive API, APIXU API, TravisCI, Heroku, Waffle, Bulma, Figaro
  
## Testing
- This application utilizes RSpec, Capybara, FactoryBot and Webmock for testing.
- SimpleCov is used to track test coverage.
<img alt="simple-cov" src="https://cl.ly/5c0ade1cffae/Screen%20Shot%202018-11-06%20at%207.49.29%20PM.jpg">
