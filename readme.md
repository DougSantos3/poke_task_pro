# Install dependencies

```bash
flutter pub get
```

# List emulators
```bash
flutter emulators
```

# Launch emulator
```bash
flutter emulators --launch emulator-5554
```

# Run app
```bash
flutter run
```

# Run tests
```bash
flutter test
```

# Flow

### (Presentation/Widget): Tudo começa com a ação do usuário (o clique).

### (Presentation/Controller): A Controller (ou Bloc/Provider) é a ponte que recebe esse evento da tela e decide qual regra de negócio chamar.

### (Domain/Use Case): O Use Case aplica a regra (ex: "tem título?"). É o cérebro que não se importa se os dados vêm da internet ou de um arquivo.

### (Data/Repository): O Repositório é o executor final que sabe como salvar (usando o Java que você quer criar ou o SQLite).


## Presentation

## Criar o widget TrelloColumn que filtra as tarefas da TodoController pelo status.

## Implementar o Draggable para que, ao soltar uma tarefa em outra coluna, a TodoController atualize o status daquela Task automaticamente.

### Types of tests

## Models: São Testes Unitários. Você testa se a conversão (JSON/Entity) está correta de forma isolada.

## Datasources: Podem ser Unitários (se você mockar o cliente HTTP ou o Driver do Banco) ou de Integração (se você usar uma instância real do banco local ou uma API de testes).

## A diferença: Se você usa um Mock para simular a resposta da API e testar apenas a lógica do seu código, ele continua sendo um teste unitário. Se o teste exige que o app "fale" com um sistema externo real (ou simulado), ele se torna integrado.

## Custo: Testes unitários na data layer são mais rápidos e baratos; testes integrados são mais lentos, mas garantem que o contrato com o backend não quebrou.