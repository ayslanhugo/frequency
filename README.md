# Frequency - Gestor de Formações JCC

<p align="center">
  <img src="public/logo.png" width="150" alt="Logo JCC">
</p>

> Aplicação web desenvolvida para gerenciar os ciclos formativos, participantes e formadores do grupo de jovens JCC (Jovens a Caminho do Céu), de inspiração franciscana.

## 📜 Sobre o Projeto

"Frequency" é uma plataforma desenvolvida para facilitar a gestão e o acompanhamento dos ciclos formativos do JCC, permitindo que os jovens continuem sua jornada de fé e crescimento espiritual de forma organizada e acessível.

Nossa caminhada começou de forma simples e autêntica: com o sonho e a inquietação de um pequeno grupo de crismandos que, inspirados pelo exemplo luminoso de São Francisco de Assis, sentiram um forte chamado para continuar crescendo na fé, mesmo após a Crisma. Este projeto é o fruto digital desse anseio.

## ✨ Principais Funcionalidades

* **Autenticação de Usuários:** Sistema completo de login, logout e sessões seguras.
* **Gestão de Formadores (Usuários):** CRUD (Criar, Ler, Atualizar, Apagar) completo para os administradores do sistema.
* **Gestão de Participantes (Alunos):** CRUD completo para gerenciar os jovens que participam do grupo.
* **Gestão de Formações (Eventos):** Cadastro e listagem dos ciclos formativos anuais.
* **Página "Sobre":** Uma página estática com a história, missão e valores do grupo.
* **Sidebar Dinâmica e Responsiva:** Menu lateral que se expande com o mouse e se adapta a diferentes tamanhos de tela, construído com Alpine.js.

## 🚀 Tecnologias Utilizadas

Este projeto foi construído com as seguintes tecnologias:

* **Backend:** Ruby on Rails 7+
* **Frontend:** Tailwind CSS, Alpine.js
* **Linguagem:** Ruby 3+
* **Banco de Dados:** SQLite3 (em desenvolvimento)
* **Servidor:** Puma

## ⚙️ Instalação e Execução (Getting Started)

Siga os passos abaixo para configurar o ambiente de desenvolvimento e rodar o projeto localmente.

### Pré-requisitos

* **Ruby:** Versão 3.0 ou superior.
* **Bundler:** `gem install bundler`
* **Node.js e Yarn** (para o gerenciamento de assets do Rails 7)
* **SQLite3**

### Passos para Instalação

1. Clone o repositório:
   git clone https://github.com/ayslanhugo/frequency.git
   cd frequency

2. Instale as dependências do Ruby (gems):
bundle install

3. Instale as dependências do JavaScript:
yarn install

4. Crie e configure o banco de dados:
rails db:create
rails db:migrate

5.Popule o banco de dados com os dados iniciais (Formações e Participantes):
rails db:seed

6.Inicie o servidor Rails:
foreman start -f Procfile.dev
