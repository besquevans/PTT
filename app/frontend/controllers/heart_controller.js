// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import ax from "axios"

export default class extends Controller {
  static targets = [ "heart" ]

  // connect() {
  //   console.log("hi")
  // }

  favorite() {
    // console.log(this.heartTarget)
    this.heartTarget.classList.toggle("far")
    this.heartTarget.classList.toggle("fas")
  }
}
