
# Flow

### (Presentation/Widget): Tudo começa com a ação do usuário (o clique).

### (Presentation/Controller): A Controller (ou Bloc/Provider) é a ponte que recebe esse evento da tela e decide qual regra de negócio chamar.

### (Domain/Use Case): O Use Case aplica a regra (ex: "tem título?"). É o cérebro que não se importa se os dados vêm da internet ou de um arquivo.

### (Data/Repository): O Repositório é o executor final que sabe como salvar (usando o Java que você quer criar ou o SQLite).


## Presentation

## Criar o widget TrelloColumn que filtra as tarefas da TodoController pelo status.

## Implementar o Draggable para que, ao soltar uma tarefa em outra coluna, a TodoController atualize o status daquela Task automaticamente.