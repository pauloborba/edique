Feature: parking space reminder
 	As a membro de um projeto
	I want to atribuir responsáveis a uma atividades
	So that todos possam ver quem está responsável por quais tarefas

 	Scenario: Adicionar responsável a atividade ociosa (Sistema)
		Given O sistema tem o projeto "Educação política para mafagafos" com data de entrega "30/06/2017"
		And possui uma atividade "Preparar palestra" no projeto "Educação política para mafagafos"
		And a atividade "Preparar palestra" não possui responsável
		And tem o usuário "Roberteson Novelino" no projeto "Educação política para mafagafos"
		When eu adiciono "Robertson Novelino" como responsável da atividade "Preparar palestra"
		Then a atividade "Preparar palestra" tem "Robertson Novelino" como responsável

 	Scenario: Adicionar mais de um responsável a uma atividade (Sistema)
   		Given O sistema tem o projeto "Educação política para mafagafos" com data de entrega "30/06/2017"
		And possui uma atividade "Preparar palestra" no projeto "Educação política para mafagafos"
		And tem o usuário "Robertson Novelino" no projeto "Educação política para mafagafos"
		And tem o usuário "Alfredo Alberto" no projeto "Educação política para mafagafos"
		And a atividade "Preparar palestra" possui o responsável "Robertson Novelino"
		When eu adiciono "Alfredo Alberto" como responsável da atividade "Preparar palestra"
		Then a atividade "Preparar palestra" mantém "Robertson Novelino" como responsável
		#And a atividade "Preparar palestra" tem "Alfredo Alberto" como responsável

  @ignore
 	Scenario: Scenario: Adicionar responsável a atividade (GUI)
   		Given Eu vejo o projeto "Educação política para mafagafos" com data de entrega "30/06/2017"
        And eu vejo uma atividade "Preparar palestra" no projeto "Educação política para mafagafos"
        And a atividade "Preparar palestra" não possui responsável
		And eu vejo "Robertson Novelino" cadastrado no sistema
		When eu entro na tela de edição da atividade "Preparar palestra"
		And eu seleciono o usuário "Robertson Novelino" como responsável da atividade "Preparar palestra"
		Then  eu vejo o usuário "Robertson Novelino" como responsável da atividade "Preparar palestra"

	@ignore
	Scenario: Adicionar mais de um responsável a uma atividade  (GUI)
		Given Eu vejo a atividade "Preparar palestra" na lista "Demais atividades" do projeto "Educação política para mafagafos"
		And o campo de responsável da atividade "Preparar palestra" está com "Robertson"
		And "Mariana" está cadastrada no sistema
		When eu entro na tela de edição da atividade "Preparar palestra"
		And eu seleciono o usuário "Mariana" como responsável da atividade "Preparar palestra"
		Then eu vejo os usuários "Robertson" e "Mariana" como responsáveis da atividade "Preparar palestra"
