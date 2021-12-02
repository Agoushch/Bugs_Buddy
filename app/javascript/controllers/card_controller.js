import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {

  }
  hover(e) {
    // console.log(e.currentTarget)
    e.currentTarget.style.background = '#ca4133'
  }
  nohover(e) {
    console.log(e.currentTarget.dataset);
    e.currentTarget.style.background = `url(${e.currentTarget.dataset.background})`;
    e.currentTarget.style.backgroundSize = 'cover'

  }


}
