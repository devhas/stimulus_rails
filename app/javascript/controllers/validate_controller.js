import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="validate"
export default class extends Controller {

  static targets = ["results"]

  phoneNumber(event) {
    if (event.key != 'Backspace' && (event.target.value.length === 3 || event.target.value.length === 7)){
      event.target.value += '-';
    }
  }

  email(event) {
    const validEmail =  String(event.target.value).toLowerCase().match(
      /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    );

    if(!validEmail) {
      const errorSpan = this.element.getElementsByClassName("error")[0]
      console.log(errorSpan)
      errorSpan.style.display = "block"
    }

  }

}
