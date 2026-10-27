# 💸 Sem Sufoco

> Aplicativo Flutter de controle financeiro simples: registre receitas e despesas, acompanhe seu saldo e organize tudo por categoria.

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/Estado-ChangeNotifier%20%2B%20Provider-blueviolet)
![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)

---

## 📖 Sobre o projeto

O **Sem Sufoco** é um app mobile desenvolvido em Flutter para ajudar pessoas (ou pequenos negócios) a centralizar entradas e saídas de dinheiro. Cada lançamento reúne estabelecimento, descrição, valor, tipo (receita ou despesa), categoria, forma de pagamento e data/hora. A partir disso, o app calcula o saldo automaticamente e apresenta gráficos e extratos para facilitar o acompanhamento financeiro.

Projeto desenvolvido em equipe como atividade de **Sistema Financeiro Simples** (Flutter), aplicando conceitos de componentização, navegação, gerenciamento de estado com `ChangeNotifier`, uso de bibliotecas externas e organização de código com Git/GitHub.

---

## 👥 Desenvolvedores

| Nome | GitHub |
| ---- | ------ |
| Patryck Dias Delfes | [@PatryckDiasDelfes](https://github.com/PatryckDiasDelfes) |
| Rafael Jordani Coelho | [@rafaeljordani](https://github.com/rafaeljordani) |
| Manuela Frazão | [@manuufrazao](https://github.com/manuufrazao) |
| Samuel Cabral | [@samuelgcabral](https://github.com/samuelgcabral) |

---

## ✨ Funcionalidades

- 🎬 **Splash screen** animada na abertura do app
- 🔐 **Login** com validação de e-mail e senha (autenticação simulada) e botões de login social (layout)
- 📊 **Dashboard** com saldo atual, variação percentual em relação ao mês anterior e gráfico de barras (receitas, despesas e saldo) agrupado por períodos de 5 dias
- 🗓️ **Seleção de mês** no dashboard para navegar entre os meses com movimentações
- 👁️ **Ocultar/exibir saldo** para maior privacidade
- 🧾 **Extrato** com a listagem das movimentações e saldo total
- ➕ **Cadastro de lançamento** com estabelecimento, valor, descrição, tipo, categoria, forma de pagamento, data e horário
- 🔎 **Detalhes do lançamento** com todos os dados registrados
- 🗂️ **Categorias** com carrossel e extrato individual de cada categoria
- ⚙️ **Configurações** com perfil do usuário e preferências

---

## 📱 Telas implementadas

| # | Tela | Rota | Descrição |
|---|------|------|-----------|
| 1 | Splash | `/splash` | Animação inicial do app |
| 2 | Login | `/login` | Identificação do usuário com validação de campos |
| 3 | Dashboard (Home) | `/HomePage` | Saldo, gráfico mensal, categorias e últimas movimentações |
| 4 | Extrato | `/extract` | Lista de lançamentos e saldo |
| 5 | Cadastro de lançamento | (aba central da barra de navegação) | Formulário com validações |
| 6 | Detalhes do lançamento | `/ReleaseDetailsPage` | Dados completos de um lançamento |
| 7 | Categorias | `/CategoriesPage` | Lista de categorias |
| 8 | Extrato da categoria | `/CategoryExtractPage` | Lançamentos de uma categoria específica |
| 9 | Configurações | `/SettingsPage` | Perfil, preferências e suporte |

---

## 📐 Regras de negócio

| # | Regra | Status |
|---|-------|--------|
| 1 | Dados obrigatórios (estabelecimento, valor, tipo, categoria, data) | ✅ Implementada no `TransactionController` |
| 2 | Tipo do lançamento: Receita ou Despesa | ✅ `enum TransactionType { income, expense }` |
| 3 | Saldo calculado automaticamente | ✅ Dashboard e extrato recalculam a cada alteração |
| 4 | Valor deve ser maior que zero | ✅ Mensagem: *"O valor deve ser maior que zero."* |
| 5 | Filtro por mês | ✅ Seleção de mês no dashboard |
| 6 | Destaque quando despesas > receitas | 🚧 Em desenvolvimento |

Validações extras: data não pode ser futura, categoria e forma de pagamento são obrigatórias.

---

## 🛠️ Tecnologias e bibliotecas

**Framework:** Flutter (Dart SDK `^3.12.2`)

**Gerenciamento de estado:** `ChangeNotifier` + [`provider`](https://pub.dev/packages/provider)

| Biblioteca | Para que é usada no projeto |
|------------|-----------------------------|
| [`go_router`](https://pub.dev/packages/go_router) | Navegação e rotas do app (`core/routes/app_router.dart`) |
| [`fl_chart`](https://pub.dev/packages/fl_chart) | Gráfico de barras de receitas, despesas e saldo no dashboard |
| [`flutter_svg`](https://pub.dev/packages/flutter_svg) | Ícones SVG na tela de login (Google, Facebook, X) e cabeçalho |
| [`carousel_slider`](https://pub.dev/packages/carousel_slider) | Carrossel de categorias |
| [`animated_notch_bottom_bar`](https://pub.dev/packages/animated_notch_bottom_bar) | Barra de navegação inferior animada |
| [`material_symbols_icons`](https://pub.dev/packages/material_symbols_icons) | Conjunto de ícones |
| [`shared_preferences`](https://pub.dev/packages/shared_preferences) | Persistência local (dependência adicionada; ainda não integrada) |
| [`intl`](https://pub.dev/packages/intl) | Formatação de datas/valores (`lib/utils.dart`) |

> 💾 **Persistência:** atualmente os dados são simulados de forma estruturada em memória (mocks em `lib/shared/mocks`). A integração com `shared_preferences` está planejada.

---

## 🗂️ Estrutura do projeto

```
lib/
├── core/
│   ├── model/            # Transaction, Category, CategorySummary
│   ├── routes/           # Configuração do go_router
│   └── theme/            # Cores e estilos de texto
├── features/
│   ├── login/            # Tela e controller de login
│   ├── home/             # Dashboard, gráfico e GraphicController
│   ├── ExtractPage/      # Extrato geral
│   ├── transaction/      # Cadastro de lançamento e TransactionController
│   ├── release_details/  # Detalhes do lançamento
│   ├── categorie/        # Categorias e extrato por categoria
│   └── settings/         # Configurações e perfil
├── shared/
│   ├── mocks/            # Dados simulados (transações e categorias)
│   ├── splash/           # Splash screen
│   └── widget/           # Widgets reutilizáveis
├── utils.dart
└── main.dart
```

---

## 🚀 Como executar

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado (compatível com Dart `^3.12.2`)
- Emulador Android/iOS ou dispositivo físico (ou Chrome, para rodar na web)
- Git

### Passo a passo

```bash
# 1. Clone o repositório
git clone https://github.com/PatryckDiasDelfes/sem_sufoco.git

# 2. Acesse a pasta do projeto
cd sem_sufoco

# 3. (Opcional) Troque para a branch de desenvolvimento
git checkout Develop

# 4. Instale as dependências
flutter pub get

# 5. Execute o app
flutter run
```

Para verificar o ambiente: `flutter doctor`.

---

## 🧪 Testes

```bash
flutter test
```

---

## 🌿 Fluxo de trabalho no GitHub

- `main`: versão estável
- `Develop`: integração das funcionalidades
- `feature/*` e `refact/*`: branches de cada tarefa, integradas via Pull Request

---

## 🔮 Próximos passos

- [ ] Destaque visual quando as despesas forem maiores que as receitas
- [ ] Edição e exclusão de lançamentos pela interface
- [ ] Persistência local com `shared_preferences`
- [ ] Filtros por tipo e categoria no extrato
- [ ] Autenticação real (e-mail/senha e login social)
- [ ] Página institucional em Flutter Web

---

## 📄 Licença

Projeto acadêmico, sem fins comerciais.
