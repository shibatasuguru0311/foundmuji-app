$(function(){
  function buildHTML(message){
    let html =
      `<div class="MessageAll">
        <div class="Iineimg">
          <p class="Iine">
            <img alt="いいね：" class="iine" src="/assets/heart-3c2a41f503ccb9ec8e27a3e00f4bbed496c2e78247236aa9a8f9843aa5eb2246.png">
          </p>
        </div>
        <div class="MessageBox" data-message-id=${message.id}>
          <div class="use">
            <div class="user1">
              <div class="user1-name">
                ${message.user_name}
              </div>
              <div class="user1-createdup">
                ${message.created_at}
              </div>
            </div>
            <p class="Message__content">
              ${message.content}
            </p>
          </div>
        </div>
      </div>`
    return html;
  };
  $('.form').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.MessageBoxMain').append(html);   
      $('form')[0].reset(); 
      $('.MessageBoxMain').animate({ scrollTop: $('.MessageBoxMain')[0].scrollHeight}); 
      $('input.submit-btn').prop('disabled', false);
    })  
    .fail(function(){
      alert('error');
    })
  });
});  
 




