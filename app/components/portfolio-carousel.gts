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
    <div class='carousel-container'>
      <div class='carousel-media'>
        <img src='/portfolio-parts/{{this.currentSlide}}.png' alt='' />
      </div>
      <div>
        <div class='carousel-button-container'>
          <button
            class='carousel-button'
            type='button'
            {{on 'click' this.previousButtonPress}}
          >
            <svg
              aria-hidden='true'
              fill='currentColor'
              viewBox='0 0 24 24'
              xmlns='http://www.w3.org/2000/svg'
            >
              <path
                fill-rule='evenodd'
                d='M15.79 18.77a.75.75 0 00-.02-1.06L9.832 12l5.938-5.71a.75.75 0 10-1.04-1.08l-6.5 6.25a.75.75 0 000 1.08l6.5 6.25a.75.75 0 001.06-.02z'
                clip-rule='evenodd'
              />
            </svg>
          </button>
          <button
            class='carousel-button'
            type='button'
            {{on 'click' this.nextButtonPress}}
          >
            <svg
              aria-hidden='true'
              fill='currentColor'
              viewBox='0 0 24 24'
              xmlns='http://www.w3.org/2000/svg'
            >
              <path
                fill-rule='evenodd'
                d='M8.21 18.77a.75.75 0 01.02-1.06L14.168 12 8.23 6.29a.75.75 0 111.04-1.08l6.5 6.25a.75.75 0 010 1.08l-6.5 6.25a.75.75 0 01-1.06-.02z'
                clip-rule='evenodd'
              />
            </svg>
          </button>
        </div>
      </div>
    </div>
  </template>
}
