Given(/^o projeto "([^"]*)" não está concluído$/) do |project_name|
	p = Project.find_by_name(project_name)
	p.finished = false
	p.save
end

Given(/^o projeto "([^"]*)" está concluído$/) do |project_name|
	p = Project.find_by_name(project_name)
	p.finished = true
	p.save
end

When(/^eu tento concluir o projeto "([^"]*)"$/) do |project_name|
	p = Project.find_by_name(project_name)
	
	page.driver.post project_finish_path(p)
end

Then(/^o projeto "([^"]*)" deve estar concluído$/) do |project_name|
	p = Project.find_by_name(project_name)

	if (!p.finished)
		throw("Error")
	end
end