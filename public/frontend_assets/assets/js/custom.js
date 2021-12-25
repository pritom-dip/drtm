$('.department_list').on('click',function(e){
    e.preventDefault();
    $('.department_subject').html('');
    var id = $(this).data('id');
    var index = $(this).data('index');
    var div = $('.department_subject').eq(index);
    div.html('');
    $.ajax({
        type: 'GET',
        url: 'main/subjects/'+id,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var list = '';
            $.each(data, function (index, element) {
                list += '<li class="subjects" style="padding-left: 10px; border-left: 10px solid rgb(67, 186, 115);" data-subject="'+element.id+'"><a href="/main/teacher_by_subject/'+element.id+'">'+element.title+'</a></li>';
            });
            div.html(list).slideDown();
        }
    });
});


$(document).ready(function(){
    setInterval(function(){
       $('#controls').children('.prevBtn').click();
    }, 4000)
});
