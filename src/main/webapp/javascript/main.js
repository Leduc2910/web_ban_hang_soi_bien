/*Dropdown menu*/
$(document).ready(function () {
    var currentSubmenu = null;

    $('.sub-menu').hide();

    $('.sub-btn').click(function (e) {
        e.stopPropagation();

        if (currentSubmenu !== null && currentSubmenu[0] !== $(this).next('.sub-menu')[0]) {
            currentSubmenu.slideUp();
            currentSubmenu.prev('.sub-btn').find('.dropdown').removeClass('rotate');
        }

        $(this).next('.sub-menu').stop(true, true).slideToggle();
        $(this).find('.dropdown').toggleClass('rotate');

        currentSubmenu = $(this).next('.sub-menu');
    });

    $(document).click(function () {
        if (currentSubmenu !== null) {
            currentSubmenu.slideUp();
            $('.sub-btn .dropdown').removeClass('rotate');
            currentSubmenu = null;
        }
    });

    $('.sub-menu').click(function (e) {
        e.stopPropagation();
    });
});

/*modal show*/