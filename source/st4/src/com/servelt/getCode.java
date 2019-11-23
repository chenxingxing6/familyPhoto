package com.servelt;
import java.awt.Color;  
import java.awt.Font;  
import java.awt.Graphics;  
import java.awt.image.BufferedImage;  
import java.io.IOException;  
import java.util.Random;  
  
import javax.imageio.ImageIO;  
import javax.servlet.ServletException;  
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  

@WebServlet("/getCode")
public class getCode extends HttpServlet {  
    public getCode() {  
        super();  
    }  
    public void destroy() {  
        super.destroy();  
    }  
    
    public Color getRandColor(int s,int e){  
        Random random=new Random ();  
        if(s>255) s=255;  
        if(e>255) e=255;  
        int r,g,b;  
        r=s+random.nextInt(e-s);    //随机生成RGB颜色中的r值  
        g=s+random.nextInt(e-s);    //随机生成RGB颜色中的g值  
        b=s+random.nextInt(e-s);    //随机生成RGB颜色中的b值  
        return new Color(r,g,b);  
    }  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {    
         //设置输出类型和浏览器不保存缓存  
         response.setContentType("image/jpeg") ;  
         response.setHeader("Cache-Control", "no-cache") ;  
         //创建图片对象  
         int width = 94,height = 40 ;  
         BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB) ;  
         Graphics g = image.getGraphics() ;  
         //生成随机数  
         Random random = new Random() ;  
         String s = "" ;  
         for(int i=0;i<4;i++){  
             s += random.nextInt(10) ;  
         }   
         //把随机数存到Session里面，便于等下比较  
         HttpSession session = request.getSession() ;  
         session.setAttribute("code",s) ;    
         //随机生成颜色  Color color =  new Color(255,255,255) ;     random.nextInt(256)的值范围是0~255  
         Color color = new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)) ;  
         //把随机数写到图片上  
         g.setColor( getRandColor(150,200));  
         g.fillRect(0, 0, width, height);   
         String a = null ;  
         Font font = new Font(a,Font.ITALIC,28) ;  
         g.setColor(color) ;  
         g.setFont(font);  
         g.drawString(s,15,height-10) ;  
         g.dispose() ;    //关闭画笔   
         //把图片送到客户端  
         ServletOutputStream output = response.getOutputStream() ;  
         ImageIO.write(image,"JPEG",output) ;  
         output.flush();   //关闭输出流  
    }  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
         this.doGet(request,response) ;  
    }  
    public void init() throws ServletException {  
    }  
}  