// app/javascript/controllers/checkbox_select_all_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // Define os "alvos" que nosso controller irá monitorar:
  // - a caixa de seleção principal ("marcar todos")
  // - todas as caixas de seleção individuais dos estudantes
  static targets = ["allCheckbox", "studentCheckbox"]

  // O método connect() roda assim que o controller é carregado na página.
  // Usamos para definir o estado inicial da caixa "marcar todos".
  connect() {
    this.refreshState()
  }

  // Ação para marcar ou desmarcar todas as caixas de uma vez.
  // Será chamada quando a caixa "marcar todos" for clicada.
  toggleAll() {
    const isChecked = this.allCheckboxTarget.checked
    this.studentCheckboxTargets.forEach((checkbox) => {
      checkbox.checked = isChecked
    })
  }

  // Ação para atualizar o estado da caixa "marcar todos".
  // Será chamada quando QUALQUER caixa de estudante for clicada.
  refreshState() {
    // Verifica se TODAS as caixas de estudantes estão marcadas.
    const allChecked = this.studentCheckboxTargets.every((checkbox) => checkbox.checked)

    // Marca ou desmarca a caixa principal de acordo.
    this.allCheckboxTarget.checked = allChecked
  }
}