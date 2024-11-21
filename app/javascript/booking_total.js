document.addEventListener('DOMContentLoaded', () => {
  const startDateField = document.getElementById('startDate');
  const endDateField = document.getElementById('endDate');
  const totalPriceElement = document.getElementById('totalPrice');
  const pricePerNight = parseInt(document.getElementById('dreamDetails').dataset.price, 10);

  function calculateTotal() {
    const startDateValue = startDateField.value;
    const endDateValue = endDateField.value;

    if (!startDateValue || !endDateValue || !pricePerNight) {
      totalPriceElement.textContent = "0€";
      return;
    }

    const startDate = new Date(startDateValue);
    const endDate = new Date(endDateValue);

    if (endDate <= startDate) {
      totalPriceElement.textContent = "0€";
      return;
    }

    const diffTime = Math.abs(endDate - startDate);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

    const total = diffDays * pricePerNight;

    totalPriceElement.textContent = `${total}€`;
  }
  startDateField.addEventListener('change', calculateTotal);
  endDateField.addEventListener('change', calculateTotal);
});
