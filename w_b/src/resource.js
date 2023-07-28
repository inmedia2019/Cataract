
window.Resource = {
    instance: {},
    create: function (option) {
        return new Builder(option)
    }

};
function Builder(opt) {
    this.option = {
        id: "res_block"
    };
    $.extend(this.option, opt);
    this.init();
    return this;
}
Builder.prototype.init = function () {
    var self = this;
    var opt = this.option;
    var $target = $("#" + opt.id);
    $target.find("#type").change(function () {
        $target.find(".r-module").hide();
        $("#r_" + $(this).val()).show();
        self._changeModule($(this).val())
    });
    this.loadModule = {};
    //$target.find(".selArticle").click(function () {
    //    parent.parent.showArticleChoice(self.allowMulArticle ? "all" : null);
    //    return false
    //});
   
    Resource.instance[opt.id] = self;
};
function alert(t) {
    G.ui.tips.err(t);
}
Builder.prototype.getResult = function () {
    var opt = this.option;
    var $target = $("#" + opt.id);
    var module = $target.find("#type").val();
    var data = null;
    switch (module) {
        case "text":
            var v = $("textarea[name='replyText']").val();
            if ($.trim(v) == "") {
                alert("文本内容不可以为空。")
            } else {
                if (v.length > 1000) {
                    alert("不超过1000个字符。")
                } else {
                    data = {
                        type: 1,
                        text: v
                    }
                }
            }
            break;
        case "article":
            if ($("div.choose").length > 0) {
                var v = $("#r_article input[type='hidden']");
                if (v.length == 0) {
                    alert("请选择图文");
                } else {
                    data = {
                        id: v.val()
                    }
                };
            } else {
                data = {
                    tyoe: "article"
                }
            }
            break; 
        case "activity":
            var $selected = $target.find("#r_activity :selected");
            if ($selected.length == 0) {
                alert("请选择一个活动模块。")
            } else {
                var t = $selected.data("list");
                var $selected_tr = $("#r_activity .selected");
                if (t) {

                    var id = $selected.attr("data-id");
                        data = {
                            type: $selected.val(),
                            id: id,
                            title: $selected.find("td.title").text(),
                            extraData: $selected.find(".keyword").text()
                        }

                } else {
                    data = {
                        type: $selected.val()
                    }
                }
            }


            break;
        case "business":
            var $selected = $target.find("#r_business :selected");
            if ($selected.length == 0) {
                alert("请选择一个业务模块。")
            } else {
                var t = $selected.data("list");
                var id = $selected.attr("data-id");
                if (t) {
                    var $selected_tr = $("#r_business .selected");
                    if ($selected_tr.length == 0) {
                        alert("请至少选择一个正在进行中的业务。")
                    } else {
                        data = {
                            type: $selected.val(),
                            id: id,
                            title: $selected.find("td.title").text(),
                            extraData: $selected.find(".keyword").text()
                        }
                    }

                } else {
                    data = {
                        type: $selected.val()
                    }
                }

            }
            break;
        case "car":
            var $selected = $target.find("#r_car :selected");
            if ($selected.length == 0) {
                alert("请选择一个。")
            } else {
                var t = $selected.data("list");
                var id = $selected.attr("data-id");
                if (t) {
                    var $selected_tr = $("#r_car .selected");
                    if ($selected_tr.length == 0) {
                        alert("请至少选择一个正在进行中的预约。")
                    } else {
                        data = {
                            type: $selected.val(),
                            id: id,
                            title: $selected.find("td.title").text(),
                            extraData: $selected.find(".keyword").text()
                        }
                    }

                } else {
                    data = {
                        type: $selected.val()
                    }
                }

            }
            break;
        default:
            data={
                type: module 
            }
            break;
    }
    return data
};


window.ICON = function () {
    var list = ["icon-file-text", "icon-globe ", "icon-credit-card", "icon-hand-up", "icon-dashboard ", "icon-money ", "icon-reorder", "icon-comments-alt ", "icon-smile", "icon-thumbs-up", "icon-truck", "icon-shopping-cart", "icon-group", "icon-user-md", "icon-home", "icon-plane", "icon-gift", "icon-food", "icon-phone", "icon-tags", "icon-rocket", "icon-cloud", "icon-map-marker", "icon-music", "icon-trophy", "icon-android", "icon-apple", "icon-star", "icon-rss-sign", "icon-heart", "icon-envelope", "icon-bar-chart", "icon-picture", "icon-download", "icon-gamepad", "icon-comment", "icon-check", "icon-cog", "icon-camera", "icon-cloud", "icon-facetime-video", "icon-spinner", "icon-bullhorn", "icon-location-arrow", "icon-list-ul", "icon-weibo", "icon-windows", "icon-time", "icon-th", "icon-user", "icon-microphone", "icon-bookmark",
        "icon-flag-checkered", "icon-qrcode", "icon-glass", "icon-stethoscope", "icon-medkit", "icon-ambulance", "icon-hospital", "icon-foursquare", "icon-download-alt", "icon-coffee", "icon-building", "icon-edit", "icon-book", "icon-question-sign", "icon-legal", "icon-calendar-empty", "icon-ellipsis-horizontal", "icon-pencil", "icon-suitcase", "icon-warning-sign", "icon-jpy", "icon-list-alt", "icon-html5", "icon-gittip", "icon-search", "icon-wrench", "icon-lemon", "icon-indent-right", "icon-paste", "icon-archive", "icon-sun", "icon-bitbucket"
    ];
    var tmp = '<li class="tile-themed"> <i class="{0}"></i></li>';
    var ul = '<ul>{0}</ul>';
    var s = '';
    $.each(list, function (k, v) {
        s += tmp.format(v);
    })
    $("div.icons-cont").html(ul.format(s));
    $(".sel-icon").click(function () {
        $(".icons-cont").toggle();
    });
    $(".icons-cont li").live("click", function () {
        var $thisclass = $(this).children().attr("class");
        $("#icon_i").attr("class", $thisclass)
        $("#icon").val($thisclass);
        $(".icons-cont").hide();
    });
    $(".icons-cont").hover(function () {

    }, function () {
        $(".icons-cont").fadeOut();
    });


}