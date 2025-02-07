import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class PortfolioCarousel extends Component {
  @tracked currentSlide = 0;

  @action
  nextButtonPress() {
    if (this.currentSlide === 19) this.currentSlide = 0
    else this.currentSlide += 1;
  }

  @action previousButtonPress() {
    if (this.currentSlide === 0) this.currentSlide = 19;
    else currentSlide -= 1;
  }
}