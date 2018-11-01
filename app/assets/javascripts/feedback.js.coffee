$ ->
  $feedback = $('.feedback');
  $textarea = $feedback.find('textarea');
  $submitBtn = $feedback.find('input[type=submit]');
  $submitBtn.on('click', (e)->
    e.preventDefault();
    content = $feedback.find('textarea:first').val()
    if content != ''
      $.ajax({
        type: 'POST',
        url: '/feedbacks.js',
        data: { feedback: { content: content } }
      })
    $feedback.html('<small>貴重なご意見をありがとうございます！<br />サービス向上のため努力いたしております。<br />また何かお気付きの点がありましたら、<br />ご意見頂ければ幸甚でございます。</small>');
  )
