Feature: Encerrar projeto
	As a membro de projeto
	I want to arquivar um projeto após seu término
	So that eu possa me concentrar apenas em projetos que tenham tarefas a fazer 

	Scenario: Encerrar um projeto em andamento (GUI)
		Given o projeto "Ouvir toda a discografia de Pink Floyd" existe no sistema
		And o projeto "Ouvir toda a discografia de Pink Floyd" não está concluído
		And eu estou na tela do projeto "Ouvir toda a discografia de Pink Floyd"
		When eu abro as opções do projeto
		And clico em "Arquivar projeto"
		Then devo ver a tela com a lista de projetos
		And eu devo ver a mensagem de que o projeto foi arquivado
		And o projeto "Ouvir toda a discografia de Pink Floyd" não é exibido na lista de projetos

	Scenario: Encerrar um projeto já encerrado (GUI)
		Given o projeto "Ouvir toda a discografia de Pink Floyd" existe no sistema
		And o projeto "Ouvir toda a discografia de Pink Floyd" está concluído
		And eu estou na tela do projeto "Ouvir toda a discografia de Pink Floyd"
		When eu abro as opções do projeto
		Then eu não devo ver o botão de "Arquivar Projeto"

	Scenario: Encerrar um projeto em andamento (sistema)
		Given o projeto "Ouvir toda a discografia de Pink Floyd" existe no sistema
		And o projeto "Ouvir toda a discografia de Pink Floyd" não está concluído
		When eu tento concluir o projeto "Ouvir toda a discografia de Pink Floyd"
		Then o projeto "Ouvir toda a discografia de Pink Floyd" deve estar concluído

	Scenario: Encerrar um projeto já encerrado (sistema)
		Given o projeto "Ouvir toda a discografia de Pink Floyd" existe no sistema
		And o projeto "Ouvir toda a discografia de Pink Floyd" está concluído
		When eu tento concluir o projeto "Ouvir toda a discografia de Pink Floyd"
		Then o projeto "Ouvir toda a discografia de Pink Floyd" deve estar concluído