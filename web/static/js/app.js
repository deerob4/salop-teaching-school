$('.ui.dropdown').dropdown();

$('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  });

$('.ui.form')
  .form({
    inline: true,
    fields: {
      teacher_title_name: 'empty',
      teacher_first_name: 'empty',
      teacher_last_name: 'empty',
      teacher_email: ['empty', 'email'],
      teacher_school_type: 'empty',
      teacher_subject: 'empty',
    }
  });

$('#teacher_school_type').on('change', function() {
  const selection = $(this).val();
  const $subject = $('#subject_field')

  switch(selection) {
    case 'primary':
      $subject.hide();
      break;

    case 'secondary':
    case 'either':
      $subject.show();
      break;

    default:
      $subject.show();
  }
})