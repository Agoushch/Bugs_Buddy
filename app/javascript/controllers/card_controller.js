import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {

  }
  hover(e) {
    // console.log(e.currentTarget)
    e.currentTarget.style.background = `linear-gradient(to bottom, rgba(202, 65, 51, 0.1), rgba(202, 65, 51, 1)),url(${e.currentTarget.dataset.background})`
      e.currentTarget.style.backgroundSize = 'cover'

  }
  nohover(e) {
    console.log(e.currentTarget.dataset);
    e.currentTarget.style.background = `url(${e.currentTarget.dataset.background})`;
    e.currentTarget.style.backgroundSize = 'cover'

  }


}
