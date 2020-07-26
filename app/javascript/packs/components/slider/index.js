import Component from '../component';

export default class Slider extends Component{
  INTERVAL = 3000;
  BASE_URL = '/api/sections';

  constructor(container) {
    super(container);
  }

  render = options => {
    const { urls } = options;

    const template = require('./template.pug');
    const locals   = { urls: urls };

    this.container.innerHTML = template(locals);
  }

  componentWillMount = options => {
    const { sectionID } = options;

    fetch(`${this.BASE_URL}/${sectionID}`)
      .then(resp => resp.json())
      .then((data) => {
        this.render(data);
      })
      .then(() => {
        this.componentDidMount();
      })
  }

  componentDidMount = options => {
    this.initElements();
    this.setEventListeners();

    this.startSlide();
  }

  initElements = () => {
    this.slide   = this.container.querySelector('.slides');
    this.nextBtn = this.container.querySelector('#next-btn');
    this.prevBtn = this.container.querySelector('#prev-btn');

    this.generateLoopSlider();

    this.index = 1;
    this.slideWidth = this.slides[this.index].clientWidth;
    this.setTranslateX();
  }

  setTranslateX = () => {
    this.slide.style.transform = `translateX(${-this.slideWidth * this.index}px)`;
  }

  setTransition = (option) => {
    this.slide.style.transition = option;
  }

  generateLoopSlider = () => {
    const initSlides = this.getSlides();

    this.firstClone = this.generateFirstClone(initSlides);
    this.slide.append(this.firstClone);

    this.lastClone = this.generateLasClone(initSlides);
    this.slide.prepend(this.lastClone);

    this.slides = this.getSlides();
  }

  getSlides = () => document.querySelectorAll('.slide');

  generateFirstClone = slides => {
    const firstClone = slides[0].cloneNode(true);
    firstClone.id = 'first-clone';

    return firstClone;
  }

  generateLasClone = slides => {
    const lastClone = slides[slides.length - 1].cloneNode(true);
    lastClone.id = 'last-clone';

    return lastClone;
  }

  setEventListeners = () => {
    this.slide.addEventListener('transitionend', this.handleTransitionEnd);
    this.container.addEventListener('mouseenter', () => {
      clearInterval(this.slideId);
    });

    this.container.addEventListener('mouseleave', this.startSlide);
    this.nextBtn.addEventListener('click', this.moveToNextSlide);
    this.prevBtn.addEventListener('click', this.moveToPreviousSlide);
  }

  handleTransitionEnd = () => {
    if (this.currentSlide.id === this.firstClone.id) {
      this.index = 1;

      this.setTranslateX();
      this.setTransition('none');
    }

    if (this.currentSlide.id === this.lastClone.id) {
      this.index = this.slides.length - 2;

      this.setTranslateX();
      this.setTransition('none');
    }
  }

  currentSlide = () => this.slides[this.index];

  startSlide = () => {
    this.slideId = setInterval(() => {
      this.moveToNextSlide();
    }, this.INTERVAL);
  }

  moveToNextSlide = () => {
    if (this.index >= this.slides.length - 1) return;

    this.index++;
    this.setTransition('.7s ease-out');
    this.setTranslateX();
  };

  moveToPreviousSlide = () => {
    if (this.index <= 0) return;

    this.index--;
    this.setTransition('.7s ease-out');
    this.setTranslateX();
  };
}
