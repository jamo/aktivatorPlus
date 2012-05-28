$(document).ready(function() {
   // put all your jQuery goodness in here.
    $('.listedCourses' ).mouseenter(function(){$(this).css('backgroundColor', '#E8E8E8')}).mouseleave(function(){$(this).css('backgroundColor', 'transparent')})
    $('table').css( 'border-collapse','collapse')

    /* This also has effect to question listings*/
    jQuery( function($) {
        $('tbody tr[data-href]').addClass('clickable').click( function() {
            window.location = $(this).attr('data-href');
        }).find('a').hover( function() {
            $(this).parents('tr').unbind('click');
        }, function() {
            $(this).parents('tr').click( function() {
                window.location = $(this).attr('data-href');
            });
        });
    });
    //end

});