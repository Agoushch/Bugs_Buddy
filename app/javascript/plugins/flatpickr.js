import flatpickr from "flatpickr";

const initFlatpickr = () => {
  let date = new Date()
  flatpickr(".datepicker", {
     allinput: true,
     enableTime: true,
        dateFormat: "Y-m-d",
    disable: [
        {
            from: "2020-04-01",
            to: date.setDate(date.getDate() - 1)

        },

    ]

  });
}

export { initFlatpickr };
