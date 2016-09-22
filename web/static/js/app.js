$('.ui.dropdown').dropdown();

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
      teacher_aware_from: 'empty',
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
});

$('#teacher_aware_from').on('change', function() {
  const selection = $(this).val();
  const $online = $('#online_explanation');

  switch(selection) {
    case 'online':
      $online.show();
      break;

    default:
      $online.hide();
  }
});

const verified = window.localStorage.getItem('verified');

if (verified) {
  showTable()
}

$('#loginButton').click(function() {
  const password = 'trickydolphin';
  const userPassword = $('#password').val();

  if (userPassword === password) {
    showTable();
    window.localStorage.setItem('verified', true);
  } else {
    alert('Incorrect password.');
  }
});

function showTable() {
  $('.login').hide();
  $('.table_view').show();
}
