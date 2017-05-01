# TwitterChatbot

This is the home for FUSE Code Camp 2017's project Twitter Chatbot! This is a beginner 1 project, so it is assuming no knowledge of ruby.
This repository will contain the code that accompanies the project class, but will not contain the detailed explanations of what is happening.
If you didn't attend the class but want to complete this course, check out some of the links below for explanations of how ruby works and then
try to work on the code with your newfound knowledge.

## Considerations

Twitter only allows a certain number of requests to its servers over time, so you may encounter an error along the lines of:

```
raise_error.rb:13:in `on_complete': Rate limit exceeded (Twitter::Error::TooManyRequests)
```

If you encounter this, do not worry! Twitter refereshes your allowed number of requests every 15 mins.


## Extending the project

If you're looking for some ideas on what you can do with a Twitter chatbot, considering the following uses:

* Use it for your personal account to answer questions about yourself
* Use it for a business account to answer questions about the business
* Use it to answer questions about an upcoming event
* Use it to tweet a random joke every so often
* Work a friend to create two chatbots that will talk to each other

Some interesting sites for ruby beginners:

https://hackhands.com/beginners-guide-ruby/
https://rubymonk.com/
http://ruby-for-beginners.rubymonstas.org

## Requirements
* Ruby 2.0.0 or later installed
* twitter gem installed (requires native compilation, see extra steps)
* Twitter account and App created in Twitter Dev

### Extra steps


#### Windows extra steps:
* install dev kit
  * download from https://rubyinstaller.org/downloads/
  * unzip
  * ruby dk.rb init
    * if it doesn't find ruby, add it to the config.yml
  * ruby dk.rb install
* need "certified" gem
  * gem install certified
  * require this gem in any twitter script


#### OSX extra steps
* xcode-select --install
