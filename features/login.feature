Feature: manages login authentication

  As an user
  So that I can only login with my LionMail

  Scenario: login with LionMail
    Given My login email address is "ll3504@columbia.edu"
    When  I go to the login page
    And   I press "Sign in with Google account"
    Then  I go to the home page

  Scenario: login with Other email
    Given My login email address is "lingxiaoli98@gmail.com"
    When  I go to the login page
    And   I press "Sign in with Google account"
    Then  I should not go to the home page

