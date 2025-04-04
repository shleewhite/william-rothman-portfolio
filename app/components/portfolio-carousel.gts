import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';

export default class PortfolioCarousel extends Component {
  @tracked currentSlide = 1;

  @action
  nextButtonPress() {
    if (this.currentSlide === 20) this.currentSlide = 1;
    else this.currentSlide += 1;
  }

  @action previousButtonPress() {
    if (this.currentSlide === 1) this.currentSlide = 20;
    else this.currentSlide -= 1;
  }

  <template>
    <div class='sr-only'>
      Slide images do not have alt text due to quantity of text. See full
      version for a PDF of all the slides.
    </div>
    <div class='carousel-container'>
      <div class='carousel-media'>
        <img src='/portfolio-parts/{{this.currentSlide}}.png' alt='' />
      </div>
      <div>
        <div class='carousel-button-container'>
          <button
            class='carousel-button'
            type='button'
            aria-label='Previous slide'
            {{on 'click' this.previousButtonPress}}
          >
            <svg
              width='24'
              height='24'
              viewBox='0 0 24 24'
              fill='none'
              xmlns='http://www.w3.org/2000/svg'
              stroke='#151515'
              stroke-width='2'
              stroke-linecap='round'
              stroke-linejoin='round'
              class='arrow-left'
            ><path d='M9 20L1 12L9 4' fill='none'></path><line
                x1='1'
                y1='12'
                x2='17'
                y2='12'
                fill='none'
              ></line></svg>
          </button>
          <button
            class='carousel-button'
            type='button'
            aria-label='Next slide'
            {{on 'click' this.nextButtonPress}}
          >
            <svg
              width='24'
              height='24'
              viewBox='0 0 24 24'
              fill='none'
              xmlns='http://www.w3.org/2000/svg'
              stroke='#151515'
              stroke-width='2'
              stroke-linecap='round'
              stroke-linejoin='round'
              class='arrow-right'
            ><path d='M15 20L23 12L15 4' fill='none'></path><line
                x1='1'
                y1='-1'
                x2='17'
                y2='-1'
                transform='matrix(-1 0 0 1 24 13)'
                fill='none'
              ></line></svg>
          </button>
        </div>
      </div>
    </div>
  </template>
}
