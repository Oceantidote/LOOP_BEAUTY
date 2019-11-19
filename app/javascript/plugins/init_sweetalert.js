import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButtons = document.querySelectorAll(selector);
  if (swalButtons) {
    swalButtons.forEach((button) => {
      button.addEventListener('click', () => {
        swal(options).then(callback);
      });
    })
  }
};

export { initSweetalert };
