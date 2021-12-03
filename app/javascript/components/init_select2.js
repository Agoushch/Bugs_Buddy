import $ from 'jquery';
import 'select2';




  const initSelect2 = () => {
  $('.select2').select2({
    placeholder: "Select the sport for which you would like to add an activity",
    // width: 100%
  });
  };



export { initSelect2 };
