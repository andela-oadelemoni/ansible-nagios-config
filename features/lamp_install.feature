Feature: Setup LAMP as Nagios Prerequisite

	Background: 
		Given I have a running server
		And I provision it

	Scenario:
		When I install Apache
		Then it should be successful
		And apache2 should be running
		And it should be accepting connections on port 80

	Scenario:
		When I install MySQL
		Then it should be successful
		And mysql should be running
		And it should be accepting connections on port 3306

	Scenario:
		When I install PHP
		Then it should be successful