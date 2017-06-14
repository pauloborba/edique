Feature: Criar atividades
	As a membro de um projeto
	I want to criar atividades
	So that possa planejar meu projeto

	Scenario: Atividades sem membros alocados sempre que forem criadas (Sistema)
		Given O sistema tem o projeto "Educação política para mafagafos" com data de entrega "05/07/2017"
		When eu crio a atividade "Preparar palestra" no projeto "Educação política para mafagafos"
		Then a atividade "Preparar palestra" não tem nenhum responsável alocado

	@ignore
	Scenario: Atividades sem membros alocados sempre que forem criadas (GUI)
		Given Eu vejo o projeto "Educação política para mafagafos" com data de entrega "05/07/2017"
		When eu entro na tela do projeto "Educação política para mafagafos"
		And eu crio a atividade "Preparar palestra"
		Then eu vejo a atividade "Preparar palestra” sem nenhum responsável alocado"

    @ignore
    Scenario: Restringir alocação na atividade para membros que fazem parte do projeto que contém a atividade (Sistema)
        Given O sistema tem o projeto "Educação política para mafagafos" com data de entrega "02/07/2017"
        And tem o usuário "Alfredo José" no projeto "Educação política para mafagafos"
        And tem o usuário "Luiz Alberto" sem nenhum projeto alocado
        When eu crio a atividade "Preparar palestra" no projeto "Educação política para mafagafos"
        Then a atividade "Preparar palestra" tem "Alfredo José" na lista de alocáveis na atividade
        And a atividade "Preparar palestra" não tem "Luiz Alberto" na lista de alocáveis na atividade

	@ignore
	Scenario: Restringir alocação na atividade para membros que fazem parte do projeto que contém a atividade (Gui)
		Given eu vejo o projeto "Educação política para mafagafos"
		And vejo o usuário "Alfredo José" no projeto "Educação política para mafagafos"
		And vejo o usuário "Luiz Alberto" sem nenhum projeto alocado
		When eu crio a atividade "Preparar palestra" no projeto "Educação política para mafagafos"
		Then eu vejo que a atividade “Preparar palestra” tem "Alfredo José" na lista de alocáveis na atividade
		And não possui "Luiz Alberto" na lista de alocáveis na atividade