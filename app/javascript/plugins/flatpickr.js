import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    allinput: true,
    enableTime: true

  });
}

export { initFlatpickr };
