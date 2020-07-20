package cn.wts.gym.web.adminAction;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 验证码的Action
 * @author 56354
 */
public class CheckCodeAction extends ActionSupport{
	public String execute() throws Exception {
		int width = 100;
        int height = 40;

        //1、创建一内存对象，在内存中图片（验证码图片对象）
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);

        //2、美化图片
        //2、1填充背景色
        Graphics g = image.getGraphics();//画笔对象
        g.setColor(Color.gray);//设置画笔颜色
        g.fillRect(0,0,width,height);
        //2.2画边框
        g.setColor(Color.blue);
        //绘制一个矩形
        g.drawRect(0,0,width-1,height-1);

        String str = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghjklmnopqrstuvwxyz0123456789";
        //生成随机角标
        Random ran = new Random();
        StringBuilder stringBuilder = new StringBuilder();

        for(int i = 1;i<=4;i++){
            int index = ran.nextInt(str.length());
            //获取字符
            char ch = str.charAt(index);//随机字符
            stringBuilder.append(ch);
            //2.3写验证码
            g.drawString(ch+"",width/5*i,height/2);
        }
        String checkCode_session = stringBuilder.toString();
		// 将生成的字母存入到session中
		ServletActionContext.getRequest().getSession()
				.setAttribute("checkCode", checkCode_session);
		//2.4画干扰线
        g.setColor(Color.GREEN);
        for (int i = 0; i <8 ; i++) {
            int x1 = ran.nextInt(width);
            int x2 = ran.nextInt(width);
            int y1 = ran.nextInt(width);
            int y2 = ran.nextInt(width);
            g.drawLine(x1,y1,x2,y2);

        }
		ImageIO.write(image, "jpg", ServletActionContext.getResponse()
				.getOutputStream());
		return NONE;
	}
	
}
