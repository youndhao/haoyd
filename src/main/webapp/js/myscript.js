$(function() {
    var Index = (function() {
        var me = {};

        // 处理子菜单点击
        me.handleSubMenuClick = function() {
            $('#accordion li a').click(function(e) {
                e.preventDefault();
                var url = this.href;
                if(url.indexOf("#") > 0 )
                {

                }else{
                if (url != null && url != 'javascript:;') {
                    $.get(url, function(data) {
                        $('#BBBDDD').html(data);
                    });
                }
                }
            });
        };

        me.init = function() {
            me.handleSubMenuClick();
        };

        return me;
    })();

    Index.init();

    $('#btn-dashboard').trigger("click");
});