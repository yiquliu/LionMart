Feature: manages products on the website for selling

  As a seller
  So that I can sell items I no longer need
  I want to post a item I would like to sell
  I also want to edit or delete existing products 
  on my page

  Background: posts have been added to database

    Given the following products exist:
      | title                   | price  | post_by | description                                                                                                                   |
      | Textbook1               | 1122.0 | irma    | Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions |
      | Textbook2               | 3.9    | yiqu    | Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions |

    Given the following users exist:
      | google_id | user_name | email               |
      | yl4617    | yiqu      | yl4617@columbia.edu |
      | jd3768    | irma      | jd3768@columbia.edu |

  Scenario: check user's homepage
    Given I am "yiqu"
    When  I am on the LionMart home page
    And   I press "My Posts"
    Then  I should see "Textbook2"
    But   I should not see "Textbook1"

  Scenario: check other user's homepage
    Given I am "yiqu"
    When  I go to the details page for "Textbook1"
    And   I press "see his/her posts"
    Then  I should see "Textbook1"
    But   I should not see "Textbook2"

  Scenario: post a new item
    Given I am on the create new post page
    And   I fill in "Title" with "Chair"
    And   I fill in "Price" with "999"
    And   I fill in "Description" with "Bought from IKEA, used for 1 year"
    When  I press "Save Changes"
    Then  I should see "Chair"

  Scenario: edit an existing product
    Given I am "irma"
    When  I go to the details page for "Textbook1"
    And   I press "Edit"
    And   I fill in "Price" with "999"
    And   I press "Update Post Info"
    Then  the price of "Textbook1" should be "999"

  Scenario: delete an existing product
    Given I am "yiqu"
    When  I go to the details page for "Textbook2"
    And   I press "Delete"
    Then  I should not see "Textbook2"
    But   I should see "Textbook1"

  Scenario: delete or edit other's product
    Given I am "Lingxiao"
    When  I go to the details page for "Textbook2"
    Then  I should not see "Edit"
    And   I should not see "Delete"
