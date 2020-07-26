import Slider from '../components/slider/index';

class SectionsController {
  components = [
    {
      class: Slider,
      selector: '.slider-container'
    }
  ]

  drawComponent = (component, containerElement) => {
    const sectionID = containerElement.dataset.section;
    const item      = new component.class(containerElement);

    item.componentWillMount({ sectionID: sectionID});
  }
  
  
  drawComponents = () => {
   this.components.forEach(component => {
      if (document.querySelector(component.selector) !== null) {
        document.querySelectorAll(component.selector).forEach((containerElement) => {
          this.drawComponent(component, containerElement);
        });
      }
    });
  }
}

window.onload = () => {
  const sectionsController = new SectionsController
  sectionsController.drawComponents();
}
