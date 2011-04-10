require_relative '../../lib/cab.rb'
require_relative '../../lib/customer.rb'


Given /^a cab$/ do
  @test_cab = Cab.new #we might change this later
end

Given /^it is on duty$/ do
  @test_cab.should be_on_duty
end

Given /^the cab is empty$/ do
  @test_cab.should be_empty
end

Given /^there is a customer$/ do
  @customer = Customer.new
end

When /^the customer hails a cab$/ do
  @customer.hails(@test_cab)
end

When /^the cab receives the hail$/ do
  @test_cab.hailed_by.should == @customer
end

Then /^the cab pulls over$/ do
  @test_cab.status.should eq("pulled over")
end 

Then /^the customer enters the cab$/ do
  @customer.gets_in(@test_cab)
  @test_cab.status.should eq("occupied")
end
 
Given /^the cab is occupied$/ do
  @test_cab.status.should eq("occupied")
end

When /^the the Cab accepts the destination$/ do
  @test_cab.accepts_destination.should eq("accepted")
end

Then /^the Cab should start the meter$/ do
  @test_cab.turn_on_meter
  @test_cab.meter.should eq "on"
end

Then /^proceed to destination$/ do
  @test_cab.proceed_to_destination
  @test_cab.meter.should eq "on"
  @test_cab.destination.should eq "set"
  @test_cab.status.should eq "occupied"
  @test_cab.empty.should eq "false"
end

When /^the cab arrives at the destination$/ do
  @test_cab.arrives
  @test_cab.destination.should eq "arrived"
end

Then /^the cab turns off the meter$/ do
  @test_cab.destination.should eq "arrived"
end

When /^the customer exits the cab$/ do
   @test_cab.exits
   @test_cab.status.should eq "empty"
end

Then /^the cab says thank you\.$/ do
  @test_cab.thank_you
  @test_cab.thank_you.should eq "Thank You"
end
