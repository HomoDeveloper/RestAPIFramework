Feature: Validating place API's

  @AddPlace
  Scenario Outline: Verify if place is being succesfully added using AddPlaceAPI
    Given Add Place Payload with "<name>" "<language>" "<address>"
    When  User calls "AddPlaceAPI" with "Post" http request
    Then The API call is success with status code 200
    And "status" in response body is "OK"
    And "scope" in response body is "APP"
    And verify place_Id created maps to "<name>" using "GetPlaceAPI"

    Examples:
      |name       |language   |address                  |
      | A house   |English    |Buchingham Palace        |
      #| B house   |Greek      |Asterionos 9             |

  @DeletePlace
    Scenario: Verify if Delete Place functionality is working
      Given DeletePlace Payload
      When User calls "DeletePlaceAPI" with "Post" http request
      Then The API call is success with status code 200
      And "status" in response body is "OK"