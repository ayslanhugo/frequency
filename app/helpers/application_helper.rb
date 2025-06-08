# app/helpers/application_helper.rb
module ApplicationHelper
  # Este método cria um padrão para todos os links da sidebar.
  def sidebar_link_classes
    "flex items-center p-2.5 text-lg font-semibold text-blue-100 rounded-lg transition-colors duration-150 " +
    "hover:bg-blue-600 hover:text-white " +
    "focus:outline-none focus:ring-2 focus:ring-blue-300 " +
    "dark:text-gray-200 dark:hover:bg-gray-700" # Prefixo 'dark:' corrigido aqui
  end
end
