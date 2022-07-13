function populate(s1, s2){
  const select1 = document.getElementById(s1)
  const select2 = document.getElementById(s2)
  select2.innerHTML = ""
  let optionArray = []
  if(select1.value == "income"){
    optionArray = [
      "salary|Salary",
      "interest|Interest",
      "allowance|Allowance",
      "saving|Saving",
      "commission|Commission",
      "bonus|Bonus",
      "other|Other"
    ]
  }else if(select1.value == "expense"){
    optionArray = [
      "education|Education",
      "food and drink|Food and drink",
      "family|Family",
      "transportation|Transportation",
      "health|Health",
      "entertainment|Entertainment",
      "social|Social",
      "lifestyle|Lifestyle",
      "bill|Bill",
      "other|Other"
    ]
  }

  for(let option in optionArray){
    const pair = optionArray[option].split("|")
    const newOption = document.createElement("option")
    newOption.value = pair[0]
    newOption.innerHTML = pair[1]
    select2.options.add(newOption)
  }
}
const modalDetail = document.getElementById('viewDetail')
modalDetail.addEventListener('show.bs.modal', event => {
  const button = event.relatedTarget
  const transactionNominal = button.getAttribute('data-bs-nominal')
  const transactionType = button.getAttribute('data-bs-type')
  const transactionCategory = button.getAttribute('data-bs-category')
  const transactionDate = button.getAttribute('data-bs-date')
  const transactionDescription = button.getAttribute('data-bs-description')
  const goalId = button.getAttribute('data-bs-goalId')
  const transactionId = button.getAttribute('data-bs-id')
  const modalAmount = modalDetail.querySelector("#modal-amount")
  const modalTitle = modalDetail.querySelector('#modal-title')
  const modalType = modalDetail.querySelector('#modal-type')
  const modalCategory = modalDetail.querySelector('#modal-category')
  const modalDescription = modalDetail.querySelector('#modal-description')
  const modalEdit = modalDetail.querySelector('#modal-edit')
  const modalDelete = modalDetail.querySelector('#modal-delete')
  modalAmount.textContent = transactionNominal
  modalTitle.textContent = transactionDate
  modalType.textContent = transactionType
  modalCategory.textContent = transactionCategory
  modalDescription.textContent = transactionDescription
  modalEdit.href = "editTransaction.jsp?transaction-id=" + transactionId + "&goal-id=" + goalId
  modalDelete.href = "controller/deleteTransactionController.jsp?transaction-id=" + transactionId + "&goal-id=" + goalId
})