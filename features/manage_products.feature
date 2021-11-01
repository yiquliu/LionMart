Feature: manages products on the website for selling

  As a seller
  So that I can sell items I no longer need
  I want to post a item I would like to sell
  I also want to edit existing products on my page

  Background: movies have been added to database

    Given the following items exist:
      | title                   | price  | description                                                                                                                   |
      | Textbook1               | 1122.0 | Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions |
      | Textbook2               | 3.9    | Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions |

    And  I am on the LionMart home page
    Then 2 seed products should exist

  Scenario: post a new item
    Given I press "New Post"
    And I create new post with title: Chair, price: 20, description: Bought from IKEA, used for 1 year
    When I press "Save Changes"
    Then I should see "Chair"

  Scenario: edit an existing product
    Given I press "Textbook1"
    And I press "Edit"
    And I edit the post with a new price: 999
    And I press "Update Post Info"
    And I press "Back to post list"
    Then I should see "999"

  Scenario: delete an existing product
    Given I press "Textbook2"
    And I press "Delete"
    Then I should not see "Textbook2"
