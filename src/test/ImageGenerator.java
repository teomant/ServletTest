package test;

import com.sun.imageio.plugins.png.PNGImageWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class ImageGenerator extends HttpServlet {

    public ImageGenerator(){

    }
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("image/png");

        int w=640;
        int h=120;

        BufferedImage image = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);

        Graphics g = image.createGraphics();

        Random rand = new Random();

        float red = rand.nextFloat();
        float green = rand.nextFloat();
        float blue = rand.nextFloat();

        g.setColor(new Color(red,green,blue));
        g.setFont(new Font("Arial",Font.BOLD,72));
        g.drawString("Hello World!",100,100);

        g.dispose();

        ImageIO.write(image,"PNG",resp.getOutputStream());

    }
}
