jQuery(document).ready(function() {
    $("#forget").click(function(){
       $(".mark").css('display','block');
       $(".register").css('display','none');
        $(".forget").css('display','block');
    })
     $("#register").click(function(){
       $(".mark").css('display','block');
       $(".forget").css('display','none');
       $(".register").css('display','block');
    })

     $(".top img").click(function(){
       $(".mark").css('display','none');
    })
    

     //忘记密码表单处理
    $('#form2').submit(function(){
        var name = $('#form2').find('.pwdname').val();
        var question = $(this).find('.question').val();
        var answer =  $(this).find('.answer').val();
        if(name == ''){
            alert('用户名还没填呢！');   
            return false;
         }
         if(answer == ''){
            alert('请输入你的答案！');   
            return false;
         }
    });

       //注册表单处理
    
    /*登入表单的实现*/
    $("#form1").submit(function(){
        var username = $("#form1").find('.username').val();
        var password = $("#form1").find('.password').val();
        var repwd =  $("#form1").find('.repwd').val();
        if(username == '') {
           window.wxc.xcConfirm('请输入用户名！', window.wxc.xcConfirm.typeEnum.info);
           return false;
        } 
        if(password == '') {
        	window.wxc.xcConfirm('请输入密码！', window.wxc.xcConfirm.typeEnum.info);
        	$("#form1").find('.password').focus();
            return false;
        }
        if(repwd == '') {
            window.wxc.xcConfirm('请输入验证码！', window.wxc.xcConfirm.typeEnum.info);
            return false;
        } 
        if(username != '')
        {
        	$.ajax({
        		type: "POST", //用POST方式传输
        		dataType: "text", //数据格式:JSON
        		url: 'checkUser.do', //目标地址
        		data: "user="+username+"&password="+password+"&code="+repwd,
        		contentType: "application/x-www-form-urlencoded; charset=utf-8",   
        		error: function (XMLHttpRequest, textStatus, errorThrown) { },
        		success: function (msg){
        			if(msg==1){
        				window.wxc.xcConfirm('登陆成功!', window.wxc.xcConfirm.typeEnum.info);
        				setTimeout(function(){
        					window.location.href="main.jsp"; 
        				},2000)
                    }else if(msg=="验证码"){
                    	var text="验证码有误！";
                    	window.wxc.xcConfirm(text, window.wxc.xcConfirm.typeEnum.info);
                    	$("#form1").find('.repwd').val("");
                    }else{
                    	var text="账号错误!";
                    	window.wxc.xcConfirm(text, window.wxc.xcConfirm.typeEnum.info);
                    	$("#form1").find('.password').val("");
                    }
        		}
        	});
        	return false;
        }
    }); 
});