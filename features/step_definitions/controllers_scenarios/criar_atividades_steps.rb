@tasks = []

Given(/^O sistema tem o projeto "([^"]*)" com data de entrega "([^"]*)"$/) do |project_name, final_date_str|
  proj_final_date = get_date_from_str(final_date_str)
  create_new_proj(project_name, proj_final_date)
end

When(/^eu crio a atividade "([^"]*)" no projeto "([^"]*)"$/) do |task_name, project_name|
  proj = Project.find_by_name(project_name)
  task = create_new_task(task_name, true, nil)
  add_task_to_proj(task, proj)
end

Then(/^a atividade "([^"]*)" não tem nenhum responsável alocado$/) do |task_name|
  task = Task.find_by_name(task_name)
  if(task.users.exists?)
    throw("A nova atividade contém usuários já alocados")
  end
end

Given(/^tem o usuário "([^"]*)" no projeto "([^"]*)"$/) do |user_name, project_name|
  user = create_user(user_name)
  proj = Project.find_by_name(project_name)
  proj.users << user
end

Given(/^tem o usuário "([^"]*)" sem nenhum projeto alocado$/) do |user_name|
  create_user(user_name)
end

Then(/^a atividade "([^"]*)" tem "([^"]*)" na lista de alocáveis na atividade$/) do |task_name, user_name|
  task = Task.find_by_name(task_name)
  user = create_user(user_name)


  if !task.users.exists?(user.id)
    throw("A atividade não contém usuário solicitado")
  end
end

Then(/^a atividade "([^"]*)" não tem "([^"]*)" na lista de alocáveis na atividade$/) do |task_name, user_name|
  task = Task.find_by_name(task_name)
  user = create_user(user_name)

  if task.users.exists?(user.id)
    throw("A atividade contém usuário solicitado")
  end
end

def create_user(task_name)
  user = User.new
  user.first_name = task_name.split(" ").first
  user.last_name = task_name.split(" ").last
  user.email = "teste@teste.com"
  user.password_digest = "123"
  user.save

  return user
end
