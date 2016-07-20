Feature: Install and setup Nagios Core

	Background:
		Given I have a running server
		And I provision it

	Scenario:
		When I install nagios
		Then it should be successful