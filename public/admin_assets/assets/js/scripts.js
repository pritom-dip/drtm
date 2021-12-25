$(function () {

    $('.sidebar-menu').tree();

    //Repeater
    if ($('.repeater').length) {
        $(".repeater").repeater({
            defaultValues: {
                'due_date': '',

            },
            show: function () {
                console.log('hello show');
                $(this).slideDown();
            },

            hide: function (deleteElement) {
                // if (confirm("Are you sure you want to delete this element?")) {
                //     $(this).slideUp(deleteElement);
                // }
                // $('.repeater-btn').on('click', function (e) {
                //     e.preventDefault();
                // });
            },
            repeaters: [
                {
                    selector: ".inner-repeater"
                }
            ],
            isFirstItemUndeletable: false,
            initEmpty: false,
        });
    }

    $('#dominionID').on('change', function () {
        var dominionID = $("#dominionID option:selected").val();
        var data = { dominion_id: dominionID };

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: 'POST',
            url: '/admin/menuprocess',
            data: data,
            dataType: 'json',
            success: function (res) {
                $('#processId').find('option').remove().end();
                $('#processId').append($('<option>', {
                    value: "",
                    text: "Please select"
                }));
                if (res.processes) {
                    $.each(res.processes, function (key, value) {
                        $('#processId').append($('<option>', {
                            value: value.id,
                            text: value.name
                        }));
                    });
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    });

    $(".menu-activated").parents('.treeview').addClass('menu-open active');



    $(document).ready(function () {
        var list = $('#mySortable'),
            updatePosition = function () {
                list.children().each(function (i, e) {
                    $(this).children('input[type="hidden"]').val(++i);
                });
            };

        list.sortable({
            placeholder: "ui-state-highlight",
            update: updatePosition
        });
    });

});

//===========Check All==================

$(document).on("change", "#checkAll", function () {
    $('input:checkbox').not(this).prop('checked', this.checked);
});

// uplode photo view
$(document).on('change', 'input.upload_image', function (e) {
    // pageLeave("true")
    e.preventDefault()
    let id = $(this).attr('code')


    let product_photo = URL.createObjectURL(e.target.files[0])

    $("#new_" + id).attr('value', 1)
    $('#' + id).attr('src', product_photo)
});



