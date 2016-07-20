require 'open3'

# Nagios scenario
When(/^I install nagios$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/nagios.yml"

	output, error, @status = Open3.capture3 "#{command}"
	puts output
	puts error
end