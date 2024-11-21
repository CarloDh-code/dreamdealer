import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static values = {
    reservedDates: Array,
  }

  connect() {
    const today = new Date();

    // Initialiser flatpickr avec les options nécessaires
    flatpickr(this.element, {
      minDate: today, // Empêche la sélection avant aujourd'hui
      disable: this.reservedDatesValue, // Désactive les dates réservées
      dateFormat: "Y-m-d", // Format de la date
      onChange: this.handleDateChange.bind(this), // Gérer la sélection d'une date
    });
  }

  handleDateChange(selectedDates, dateStr, instance) {
    // Action personnalisée si nécessaire lorsque l'utilisateur sélectionne une date
    console.log(`Date sélectionnée : ${dateStr}`);
  }
}
