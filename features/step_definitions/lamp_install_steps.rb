require 'open3'

# Background step
# Run the server
Given(/^I have a running server$/) do
	output, error, status = Open3.capture3 "vagrant reload"
	expect(status.success?).to eq(true)
end

# Provision the server
And(/^I provision it$/) do
	output, error, status = Open3.capture3 "vagrant provision"
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/lamp.yml --tags 'common'"

	common_output, common_error, common_status = Open3.capture3 "#{command}"
	expect(status.success?).to eq(true)
	expect(common_status.success?).to eq(true)
end

# Apache scenario
When(/^I install Apache$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/lamp.yml --tags 'apache'"

	output, error, @status = Open3.capture3 "#{command}"
end

Then(/^it should be successful$/) do
	expect(@status.success?).to eq(true)
end

And(/^([^"]*) should be running$/) do |service|
	case service
  when 'mysql', 'xinetd'
    output, error, status = Open3.capture3 "vagrant ssh -c 'sudo service #{service} status'"
    expect(status.success?).to eq(true)

    puts output
    expect(output).to match("#{service} start/running")
  when 'apache2', 'nagios'
    output, error, status = Open3.capture3 "vagrant ssh -c 'sudo service #{service} status'"
    expect(status.success?).to eq(true)

    puts output
    expect(output).to match("is running")
  else
    raise 'Not Implemented'
  end
end

And(/^it should be accepting connections on port ([^"]*)$/) do |port|
	command = "vagrant ssh -c 'curl -f http://localhost:#{port}'"
	output, error, status = Open3.capture3 "#{command}"

	expect(status.success?).to eq(true)
end

# MySQL Scenario
When(/^I install MySQL$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/lamp.yml --tags 'mysql'"

	output, error, @status = Open3.capture3 "#{command}"
end

And(/^MySQL should be running$/) do
	command = "vagrant ssh -c '/etc/init.d/mysql status'"
	output, error, status = Open3.capture3 "#{command}"

	expect(status.success?).to eq(true)
	expect(output).to match("mysql start/running")
end

When(/^I install PHP$/) do
	command = "ansible-playbook -i hosts --private-key=.vagrant/machines/default/virtualbox/private_key playbooks/lamp.yml --tags 'php'"
	output, error, @status = Open3.capture3 "#{command}"
end

