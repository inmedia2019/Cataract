<%@ Control Language="C#" AutoEventWireup="true" CodeFile="image.ascx.cs" Inherits="UserControl_wx" %>


<div>
    <script id="containera" type="text/plain" style="width: 500px; height: 100px;"></script>
</div>
<script>
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('containera', {
        toolbars: [
            ['fullscreen', 'source', 'undo', 'redo'],
            ['insertimage']
        ]
    });
    UE.getEditor('containera').setContent('<%=imglist%>');
</script>
