
Given(/^eu vejo uma atividade "([^"]*)" no projeto "([^"]*)"$/) do |task_name, project_name|
  proj = Project.find_by_name(project_name)
  task = create_new_task(task_name, true, nil)
  add_task_to_proj(task, proj)
end



Given(/^eu vejo "([^"]*)" cadastrado no sistema$/) do |user_name|
  create_user(user_name)
end


When(/^eu entro na tela de edição da atividade "([^"]*)"$/) do |taks|
end


When(/^eu seleciono o usuário "([^"]*)" como responsável da atividade "([^"]*)"$/) do |name, taks|

end


Then(/^eu vejo o usuário "([^"]*)" como responsável da atividade "([^"]*)"$/) do |user_name,task_name|
  user = User.find_by_first_name(user_name.split(" ").first)
  task = Task.find_by_name(task_name)

  if !user.tasks.exists?(task.id)
    throw("Erro")
  end
end


