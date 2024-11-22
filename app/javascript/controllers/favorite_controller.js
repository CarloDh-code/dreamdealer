import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ['like', 'dislike']
  connect() {
    console.log("Hello from our first Stimulus controller");
  }

  togglefavorite(event) {
    event.preventDefault()
    console.log("Hello boss")

    const liked = !this.likeTarget.classList.contains('d-none');

    if (this.likeTarget.classList.contains('d-none')) {
      this.likeTarget.classList.remove('d-none'); // Affiche l'icône "like"
      this.dislikeTarget.classList.add('d-none'); // Cache l'icône "dislike"
    } else {
      // Sinon, on fait l'inverse (on délike)
      this.likeTarget.classList.add('d-none'); // Cache l'icône "like"
      this.dislikeTarget.classList.remove('d-none'); // Affiche l'icône "dislike"
    }
  }
}
