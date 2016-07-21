require 'open3'

# Nagios scenario
When(/^I install nagios$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/nagios.yml"

	output, error, @status = Open3.capture3 "#{command}"
	puts output
	puts error
end

When(/^I install requirements$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/nagios.yml --tags 'provision'"

	output, error, @status = Open3.capture3 "#{command}"
end

When(/^I install nagios core$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/nagios.yml --tags 'nagios_core'"

	output, error, @status = Open3.capture3 "#{command}"
end

When(/^I install plugin$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/nagios.yml --tags 'nagios_plugin'"

	output, error, @status = Open3.capture3 "#{command}"
end

When(/^I install nrpe$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/nagios.yml --tags 'nrpe'"

	output, error, @status = Open3.capture3 "#{command}"
end

When(/^I configure nagios$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/nagios.yml --tags 'nagios_configure'"

	output, error, @status = Open3.capture3 "#{command}"
end

When(/^I configure apache$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/nagios.yml --tags 'nagios_configure'"

	output, error, @status = Open3.capture3 "#{command}"
end



