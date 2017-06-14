@proj = nil

Given(/^Eu vejo o projeto "([^"]*)" com data de entrega "([^"]*)"$/) do |project_name, final_date_str|
  proj_final_date = get_date_from_str(final_date_str)
  create_new_proj(project_name, proj_final_date)
end

When(/^eu entro na tela do projeto "([^"]*)"$/) do |project_name|
  proj = Project.find_by_name(project_name)
  @proj = proj
  visit "/#{proj.id}"
end

When(/^eu crio a atividade "([^"]*)"$/) do |task_name|
  proj = Project.find_by_name(@proj)
  task = create_new_task(task_name, true, nil)
end

Then(/^eu vejo a atividade "([^"]*) sem nenhum responsável alocado$/) do |task_name|
#  task = Task.find_by_name(task_name)

#  if(task.users.exists?)
#    throw("A nova atividade contém usuários já alocados")
#  end
end


