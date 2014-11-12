MisfitGem
==========

Provides access to the Misfit Shine API (http://build.misfit.com) through oAuth.

As the Misfit Shine API is currently in BETA and under development, pull requests are appreciated if API support starts to show gaps.

## Installation

Install misfit_gem

```bash
$ gem install misfit_gem
```

or add it to your Gemfile

```ruby
gem 'misfit_gem'
```

## Authentication

Omniauth is the best way to connect your users to the Misfit API. Use [omniauth-shine](https://github.com/socialworkout/omniauth-shine) to integrate Misfit accounts into your web application. You will need the OAuth `access_token` as a minimum.

## Configuration

In order to use MisfitGem you'll first need to configure a client.

```ruby
@client ||= MisfitGem::Client.new(
  consumer_key: ENV["MISFIT_API_KEY"],
  consumer_secret: ENV["MISFIT_API_SECRET"],
  token: oauth_access_token,
  secret: oauth_secret
  )
```

## Usage

See the [Misfit Resource Reference](https://build.misfit.com/docs/references#APIReferences-ResourceServerAPIs) for more details on request and response parameters.

### Profile

Gets the current user's profile information

```ruby
@client.get_profile
```

### Device

Get the current user's device information (only returns information about one - current - device)

```ruby
@client.get_device
```

### Goal

Get the user's goals within a period. 

**Required:** Start Date and End Date.

```ruby
@client.get_goals(start_date: Date.today - 1.week, end_date: Date.today)
```

### Summary

Get a summary of the user's activity within a period.

**Required:** Start Date and End Date.

*Optional:* Detail (true/false). Defaults to false.

```ruby
@client.get_summary(start_date: Date.today - 1.week, end_date: Date.today, detail: true)
```

### Session

Get the user's sessions within a period. 

**Required:** Start Date and End Date.

```ruby
@client.get_sessions(start_date: Date.today - 1.week, end_date: Date.today)
```

### Sleep

Get the user's sleeps within a period. 

**Required:** Start Date and End Date.

```ruby
@client.get_sleeps(start_date: Date.today - 1.week, end_date: Date.today)
```

## Disclaimer

I am not employed by Misfit. This gem was created to help ruby developers build applications on top of misfit.com's data.
