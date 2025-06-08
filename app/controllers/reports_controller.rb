# app/controllers/reports_controller.rb
class ReportsController < ApplicationController
  def frequency
    @events = Event.includes(:students).order(event_at: :asc)

    respond_to do |format|
      format.html # A visualização em HTML continua funcionando normalmente

      format.pdf do
  html_string = render_to_string(
    template: "reports/frequency",
    layout: "pdf"
  )

  pdf = Grover.new(
    html_string,
    format: "A4",
    # Adicionamos esta opção para forçar a codificação UTF-8
    meta_tags: { "charset" => "UTF-8" }
  ).to_pdf

  send_data pdf,
    filename: "relatorio_frequencia_jcc.pdf",
    type: "application/pdf",
    disposition: "inline"
end
    end
  end
end
