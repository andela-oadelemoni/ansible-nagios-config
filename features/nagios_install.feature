Feature: Install and setup Nagios Core

	Background:
		Given I have a running server
		And I provision it

	Scenario:
		When I install requirements
		Then it should be successful

	Scenario:
		When I install nagios core
		Then it should be successful

	Scenario:
		When I install plugin
		Then it should be successful

	Scenario:
		When I install nrpe
		Then it should be successful
		And xinetd should be running

	Scenario:
		When I configure nagios
		Then it should be successful

	Scenario:
		When I configure apache
		Then it should be successful
		And apache2 should be running
		And nagios should be running