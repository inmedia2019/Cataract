 wx.ready(function () {
  
   wx.onMenuShareAppMessage({
      title: $("#hftitle").val(),
      desc: $("#hfdescript").val(),
      link: window.location.href,
      imgUrl: 'http://wechat.ittribal.com'+$("#hfImg").val(),
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
       // alert('用户点击发送给朋友');
      },
      success: function (res) {
       // alert('已分享');
      },
      cancel: function (res) {
        //alert('已取消');
      },
      fail: function (res) {
       // alert(JSON.stringify(res));
      }
    });
    
    
     wx.onMenuShareTimeline({
      title: $("#hftitle").val(),
      desc: $("#hfdescript").val(),
      link: window.location.href,
      imgUrl: 'http://wechat.ittribal.com'+$("#hfImg").val(),
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
        //alert('用户点击分享到朋友圈');
      },
      success: function (res) {
        //alert('已分享');
      },
      cancel: function (res) {
       // alert('已取消');
      },
      fail: function (res) {
        //alert(JSON.stringify(res));
      }
    });
    
     wx.onMenuShareQQ({
      title: $("#hftitle").val(),
      desc: $("#hfdescript").val(),
      link: window.location.href,
      imgUrl:  'http://wechat.ittribal.com'+$("#hfImg").val(),
      trigger: function (res) {
       // alert('用户点击分享到QQ');
      },
      complete: function (res) {
        //alert(JSON.stringify(res));
      },
      success: function (res) {
        //alert('已分享');
      },
      cancel: function (res) {
        //alert('已取消');
      },
      fail: function (res) {
       // alert(JSON.stringify(res));
      }
    });
    
     wx.onMenuShareWeibo({
      title: $("#hftitle").val(),
      desc: $("#hfdescript").val(),
      link: window.location.href,
      imgUrl:  'http://wechat.ittribal.com'+$("#hfImg").val(),
      trigger: function (res) {
        //alert('用户点击分享到微博');
      },
      complete: function (res) {
        //alert(JSON.stringify(res));
      },
      success: function (res) {
        //alert('已分享');
      },
      cancel: function (res) {
        //alert('已取消');
      },
      fail: function (res) {
        //alert(JSON.stringify(res));
      }
    });
  
  });
  