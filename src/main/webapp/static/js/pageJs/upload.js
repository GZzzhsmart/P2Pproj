layui.use('upload', function(){
    var $ = layui.jquery
        ,upload = layui.upload;

    //普通图片上传

    var uploadInst = upload.render({

        elem: '#test1'

        , url: '../home/upload'

        , exts:'png|PNG|JPEG|jpeg|gif|GIF|jpg|JPG' //只允许上传压缩文件

        , before: function (obj) {

            //预读本地文件示例，不支持ie8

            obj.preview(function (index, file, result) {
                var image1= $('#image1');
                image1.html('<img style="width: 150px;height: 130px;background-color: white" id="demo1">');
                $('#demo1').attr('src', result); //图片链接（base64）

            });

        }

        , done: function (res) {

            //如果上传失败

            if (res.code > 0) {

                return layer.msg('上传失败');

            }

            //上传成功
            if(res.code==0) {
                $('#pic1').val(res.filePath);
                $("#homeAdd").data("bootstrapValidator").resetForm();
                return layer.msg(res.msg);
            }
        }

        , error: function () {

            //演示失败状态，并实现重传

            var demoText = $('#demoText1');

            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');

            demoText.find('.demo-reload').on('click', function () {

                uploadInst.upload();

            });

        }
    });

});
layui.use('upload', function(){
    var $ = layui.jquery
        ,upload = layui.upload;

    //普通图片上传

    var uploadInst = upload.render({

        elem: '#test2'

        , url: '../home/upload'

        , exts: 'png|PNG|JPEG|jpeg|gif|GIF|jpg|JPG' //只允许上传压缩文件

        , before: function (obj) {

            //预读本地文件示例，不支持ie8

            obj.preview(function (index, file, result) {
                var image2= $('#image2');
                image2.html('<img style="width: 250px;height: 150px;background-color: white" id="demo2">');
                $('#demo2').attr('src', result); //图片链接（base64）

            });

        }

        , done: function (res) {

            //如果上传失败

            if (res.code > 0) {

                return layer.msg('上传失败');

            }

            //上传成功
            if(res.code==0) {
                $('#pic2').val(res.filePath);
                $("#homeAdd").data("bootstrapValidator").resetForm();
                return layer.msg(res.msg);
            }

        }

        , error: function () {

            //演示失败状态，并实现重传

            var demoText = $('#demoText2');

            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');

            demoText.find('.demo-reload').on('click', function () {

                uploadInst.upload();

            });

        }
    });

});
layui.use('upload', function(){
    var $ = layui.jquery
        ,upload = layui.upload;

    //普通图片上传

    var uploadInst = upload.render({

        elem: '#test3'

        , url: '../home/upload'

        , exts: 'png|PNG|JPEG|jpeg|gif|GIF|jpg|JPG' //只允许上传压缩文件

        , before: function (obj) {

            //预读本地文件示例，不支持ie8

            obj.preview(function (index, file, result) {
                var image3= $('#image3');
                image3.html('<img style="width: 150px;height: 130px;background-color: white" id="demo3">');
                $('#demo3').attr('src', result); //图片链接（base64）

            });

        }

        , done: function (res) {

            //如果上传失败

            if (res.code > 0) {

                return layer.msg('上传失败');

            }

            //上传成功
            if(res.code==0) {
                $('#pic3').val(res.filePath);
                $("#homeAdd").data("bootstrapValidator").resetForm();
                return layer.msg(res.msg);
            }

        }

        , error: function () {

            //演示失败状态，并实现重传

            var demoText = $('#demoText3');

            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');

            demoText.find('.demo-reload').on('click', function () {

                uploadInst.upload();

            });

        }
    });

});
layui.use('upload', function(){
    var $ = layui.jquery
        ,upload = layui.upload;

    //普通图片上传

    var uploadInst = upload.render({

        elem: '#test4'

        , url: '../home/upload'

        , exts: 'png|PNG|JPEG|jpeg|gif|GIF|jpg|JPG' //只允许上传压缩文件

        , before: function (obj) {

            //预读本地文件示例，不支持ie8

            obj.preview(function (index, file, result) {
                var image4= $('#image4');
                image4.html('<img style="width: 150px;height: 130px;background-color: white" id="demo4">');
                $('#demo4').attr('src', result); //图片链接（base64）

            });

        }

        , done: function (res) {

            //如果上传失败

            if (res.code > 0) {

                return layer.msg('上传失败');

            }

            //上传成功
            if(res.code==0) {
                $('#ewm').val(res.filePath);
                $("#homeAdd").data("bootstrapValidator").resetForm();
                return layer.msg(res.msg);
            }

        }

        , error: function () {

            //演示失败状态，并实现重传

            var demoText = $('#demoText4');

            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');

            demoText.find('.demo-reload').on('click', function () {

                uploadInst.upload();

            });

        }
    });
});
layui.use('upload', function(){
    var $ = layui.jquery
        ,upload = layui.upload;

    //普通图片上传
    var uploadInst = upload.render({
        elem: '#picx'
        ,url: '../media/upload'
        ,exts: 'png|PNG|JPEG|jpeg|gif|GIF|jpg|JPG' //只允许上传压缩文件
        ,before: function(obj){
            //预读本地文件示例，不支持ie8
            obj.preview(function(index, file, result){
                var demo= $('#demo');
                demo.html('<img style="width: 150px;height: 130px;background-color: white" id="demo1">');
                $('#demo1').attr('src', result); //图片链接（base64）
            });
        }
        ,done: function(res){
            //如果上传失败
            if(res.code > 0){
                return layer.msg('上传失败');
            }
            if(res.code==0) {
                $('#pic').val(res.filePath);
                $("#mediaAdd").data("bootstrapValidator").resetForm();
                return layer.msg(res.msg);
            }
        }
        ,error: function(){
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function(){
                uploadInst.upload();
            });
        }
    });
});
