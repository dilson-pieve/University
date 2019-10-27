
/**
 *
 * @author pieve
 */

package trab;
    
import java.awt.Color;
import javax.swing.JFrame;

public class Trab {
    
    public Trab () {
        
        JFrame f = new JFrame("Trabalho Programação Aplicada - 2018");
        Game g = new Game ();
        
        f.add (g);
        
        f.setResizable (false);
        
        f.setBounds (170, 10, 805, 515);
       
        f.setLocationRelativeTo(null);
        
        f.setVisible (true);
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
    }
    
    
    public static void main(String[] args) {
        Trab feito = new Trab ();
    }
    
}
