@tasks = []

Given(/^possui uma atividade "([^"]*)" no projeto "([^"]*)"$/) do |task_name, project_name|
  proj = Project.find_by_name(project_name)
  task = create_new_task(task_name, true, nil)
  add_task_to_proj(task, proj)
end

Given(/^a atividade "([^"]*)" não possui responsável$/) do |task_name|
  task = Task.find_by_name(task_name)
  if(task.users.exists?)
    throw("A nova atividade contém usuários já alocados")
  end
end


When(/^eu adiciono "([^"]*)" como responsável da atividade "([^"]*)"$/) do |user_name, task_name|
  user = create_user(user_name)
  task = Task.find_by_name(task_name)

  add_user_to_task(user, task)
end

Then(/^a atividade "([^"]*)" tem "([^"]*)" como responsável$/) do |task_name, user_name|
  user = User.find_by_first_name(user_name.split(" ").first)
  task = Task.find_by_name(task_name)

  if !task.users.exists?(user.id)
    throw("Erro")
  end

end