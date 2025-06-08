# app/helpers/application_helper.rb
require "base64" # Necessário para o novo helper

module ApplicationHelper
  # Helper que você já tem, para os links da sidebar. Está perfeito.
  def sidebar_link_classes
    "flex items-center p-2.5 text-lg font-semibold text-blue-100 rounded-lg transition-colors duration-150 " +
    "hover:bg-blue-600 hover:text-white " +
    "focus:outline-none focus:ring-2 focus:ring-blue-300 " +
    "dark:text-gray-200 dark:hover:bg-gray-700"
  end

  # --- ADICIONE ESTE NOVO HELPER ABAIXO ---
  # Este método converte uma imagem da pasta /public para o formato Base64,
  # garantindo que ela seja exibida no PDF.
  def embedded_image(filename)
    # Constrói o caminho completo para o arquivo dentro da pasta 'public'
    file_path = Rails.root.join("public", filename)

    # Verifica se o arquivo realmente existe antes de continuar
    return unless File.exist?(file_path)

    # Lê o arquivo, converte para Base64 e formata como uma URI de dados
    image_data = File.read(file_path)
    base64_image = Base64.encode64(image_data).gsub(/\s+/, "")
    "data:image/png;base64,#{base64_image}"
  end
end
