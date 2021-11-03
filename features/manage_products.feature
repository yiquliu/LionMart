Feature: manages products on the website for selling

  As a seller
  So that I can sell items I no longer need
  I want to post a item I would like to sell
  I also want to edit existing products on my page

  Background: movies have been added to database

    Given the following products exist:
      | title                   | price  | description                                                                                                                   |
      | Textbook1               | 1122.0 | Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions |
      | Textbook2               | 3.9    | Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions |
#    And I have logged in as "user@columbia.com"
  Scenario: post a new item
    Given I am on the create new post page
    And I fill in "Title" with "Chair"
    And I fill in "Price" with "999"
    And I fill in "Description" with "Bought from IKEA, used for 1 year"
    When I press "Save Changes"
    Then I should see "Chair"

  Scenario: edit an existing product
    When I go to the edit page for "Textbook1"
    And  I fill in "Price" with "999"
    And  I press "Update Post Info"
    Then the price of "Textbook1" should be "999"

  Scenario: delete an existing product
    Given I am on the details page for "Textbook2"
    And I press "Delete"
    Then I should not see "Textbook2"
