Feature: Customer take cab
As a Customer
I want to hail a cab 
So I can get home.

Scenario: Hail Cab
Given a cab
And it is on duty
And the cab is empty 
And there is a customer
When the customer hails a cab
And the cab receives the hail
Then the cab pulls over
And the customer enters the cab
And the cab is occupied
When the the Cab accepts the destination
Then the Cab should start the meter
And proceed to destination
When the cab arrives at the destination
Then the cab turns off the meter
When the customer exits the cab
Then the cab says thank you. 
