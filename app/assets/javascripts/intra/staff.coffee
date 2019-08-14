$ ->
  $('.stamping').on('click', ()->
    form = $(this).parents('form');
    type_id = $(this).data('type');
    $('<input>').attr({
      'type': 'hidden',
      'name': 'stamped_each[stamped_type_id]',
      'value': type_id
    }).appendTo(form);
    form.submit();
  );
