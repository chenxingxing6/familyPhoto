function back(url){
 	window.location.href=url;
 }

function submitlogin(){
    var username = $('#form2').find('.name').val();
    var pwd = $('#form2').find('.pwd').val();
    var repwd =  $('#form2').find('.repwd').val();
    var qq =  $('#form2').find('.qq').val();
    var phone =  $('#form2').find('.phone').val();
    if(username == ''){
        alert('请输入用户名！');   
        return false;
     }
     if(pwd == ''){
        alert('请输入密码!');   
        return false;
     }
     if(repwd == ''){
        alert('请输入确认密码！');   
        return false;
     }
      if(repwd != pwd){
        alert('两次密码不一致！');    
        return false;
     }
     if(phone == ''){
        alert('请输入手机号！');    
        return false;
     }
     if(qq == ''){
        alert('请输入QQ号！');    
        return false;
     }
     else{
     	return true;
     }
}

