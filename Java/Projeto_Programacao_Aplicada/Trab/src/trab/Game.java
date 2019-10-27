/**
 *
 * @author pieve
 */
package trab;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import java.util.Random;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.Timer;

public class Game extends JPanel implements KeyListener, ActionListener {

    private int width = 800, height = 500;

    private int[] cobraX;
    private int[] cobraY;
    private int[] bPx, bPy;

    private int pontos, tamanho;

    private boolean right, left, up, down;
    private ImageIcon head, body;

    private Timer timer;
    private Random rand;

    private Color cB;
    private int bX, bY, pX = 10, pY = 10;

    private boolean perdeu;

    private ImageIcon back;

    /* save part */
    
    private BufferedReader oldSave;
    private BufferedWriter newSave;

    private final  ArrayList<String> data = new ArrayList<>();
    private final  ArrayList<Integer> points = new ArrayList<>();;

    /* */
    private int recorde;
    private boolean stop, score, save, movimento;
    
    private int dx;
    
    public Game() {
        dx = 0;
        perdeu = stop = score = save = movimento = false;
        
        recorde = 0;
        
        timer = new Timer(90, this);
        timer.start();

        rand = new Random();

        cobraX = new int[1000];
        cobraY = new int[1000];
        bPx = new int[1000];
        bPy = new int[1000];

        addKeyListener(this);
        setFocusable(true);
        setFocusTraversalKeysEnabled(false);

        cB = new Color(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255));

        int p = 0;
        for (int i = 100; i <= width - 150; ++i) {
            if (i % 25 == 0) {
                bPx[p] = i;
                p++;
            }
        }
        pX = p;

        p = 0;
        for (int i = 100; i <= height - 150; ++i) {
            if (i % 25 == 0) {
                bPy[p] = i;
                ++p;
            }
        }

        pY = p;

        getRandom();
        carregaArquivo();
    }

    private Boolean getPosition(int a, int b) {
        for (int i = 0; i < tamanho; ++i) {
            if (a == cobraX[i] && b == cobraY[i]) return false;
        }
        return true;
    }
    
    private void getRandom() {
        
        bX = bPx[rand.nextInt(pX)];
        bY = bPy[rand.nextInt(pY)];
    
        while (!getPosition(bX, bY)) {
            
            bX = bPx[rand.nextInt(pX)];
            bY = bPy[rand.nextInt(pY)];

        }
        
    }

    @Override
    public void paintComponent(Graphics g) {

        if (movimento == false) {
            startGame();
            cobraX[2] = 50;
            cobraX[1] = 75;
            cobraX[0] = 100;

            cobraY[2] = cobraY[1] = cobraY[0] = 200;
        }

        /* bordas e fundo*/
        back = new ImageIcon("back.jpg");
        back.paintIcon(this, g, 0, 0);

        g.setColor(Color.WHITE);
        g.drawRect(24, 24, width - 48, height - 73);

        g.setColor(new Color(0, 0, 0, 190)); // ultimo = opacidade.
        g.fillRect(25, 25, width - 49, height - 74);

        /* placar */
        g.setColor(Color.WHITE);

        g.drawRect(width - 135, 30, 100, 35);

        g.setFont(new Font("Arial", Font.PLAIN, 14));
        g.drawString("Pontos: " + pontos, width - 130, 45);

        g.setFont(new Font("Arial", Font.PLAIN, 14));
        g.drawString("Tamanho: " + tamanho, width - 130, 60);

        /* snake */

        head = new ImageIcon("cabeca2.png");
        head.paintIcon(this, g, cobraX[0], cobraY[0]);
        for (int i = 1; i < tamanho; ++i) {
            body = new ImageIcon("body.png");
            body.paintIcon(this, g, cobraX[i], cobraY[i]);
        }

        g.setColor(cB);
        g.fillOval(bX, bY, 30, 30);
        
        // colisão
        
        if (bX == cobraX[0] && bY == cobraY[0]) {
            ++tamanho;
            pontos += (int) rand.nextInt(19) + 1;

            getRandom();
            
            cB = (new Color(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255)));
        
        }

        if (stop) {
            dx = 70;
            g.setColor(Color.WHITE);
            
            g.setFont(new Font("Arial", Font.BOLD, 25));
            g.drawString("Sair?", width / 2 - dx + 15, height / 2 - 110);
            g.drawString("Y = Sim", width / 2 - dx, height / 2 - 55);
            g.drawString("N = Não", width / 2 - dx, height / 2 - 15);
            
        }
        
        if (score) {
            dx = 90;
            g.setColor(Color.WHITE);
            
            g.setFont(new Font("Arial", Font.BOLD, 25));
            
            g.drawString("Atual: " + pontos, width / 2 - dx, height / 2 - 55);
            g.drawString("Recorde: " + recorde, width / 2 - dx, height / 2 - 15);
            g.drawString("Esc = Voltar", width / 2 - dx, height / 2 + 65);
            if (save) g.setColor(Color.GREEN);
            g.drawString("S = Salvar atual", width / 2 - dx, height / 2 + 25);
        }
        
        for (int i = 1; i < tamanho; ++i) {

            if (cobraX[i] == cobraX[0] && cobraY[i] == cobraY[0] && !stop && !score) {
                dx = 100;
                /* end Game */
                g.setColor(Color.WHITE);

                g.setFont(new Font("Arial", Font.BOLD, 40));
                g.drawString("Fim de Jogo!", width / 2 - dx - 30, height / 2 - 110);

                g.setFont(new Font("Arial", Font.BOLD, 25));

                g.drawString(" R = Reiniciar", width / 2 - dx, height / 2 - 55);
                g.drawString(" P = Pontuação", width / 2 - dx, height / 2 - 15);
                g.drawString(" Esc = Sair", width / 2 - dx, height / 2 + 65);
                if (save) g.setColor(Color.GREEN);
                g.drawString(" S = Salvar", width / 2 - dx, height / 2 + 25);

                perdeu = true;
            }
        }
    }

    private void startGame() {
        tamanho = 3;
        pontos = 0;
        if(perdeu){
            getRandom();
            cB = (new Color(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255)));
        }
        left  = up = down = perdeu = save = movimento = false;
        right = true;
    }

    private void carregaArquivo() {
        
          try {
                
                File f = new File("save.txt");
                
                if (!f.exists()) {
                    f.createNewFile();
                }
                points.clear();
                data.clear();
                oldSave = new BufferedReader(new FileReader(f));
                if(pontos!=0){
                    points.add ( pontos );
                    data.add( new SimpleDateFormat("dd/MM/yyyy ").format( new Date()));
                }
                while (oldSave.ready()) {
                    points.add(  Integer.parseInt ( oldSave.readLine() ));
                    data.add(oldSave.readLine());
                }
                
                oldSave.close();
              
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        
        
    }
    
    void procura () {
         for (int i = 0; i < points.size(); ++i) {
                if (recorde < points.get(i)) {
                    recorde = points.get(i);
                }
            }
    }
    
    @Override
    public void keyPressed(KeyEvent e) {
        
        if (e.getKeyCode() == KeyEvent.VK_Y && stop) {
            System.exit(0);
        }
        
        if (e.getKeyCode() == KeyEvent.VK_N && stop) {
            stop = false;
            repaint();
        }
        
        if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
            if (score) score = false;
            else stop = true;
            repaint();
        }
        
        
        if (e.getKeyCode() == KeyEvent.VK_R && perdeu && !stop && !score) {
            startGame();
            repaint();
        }

        if (e.getKeyCode() == KeyEvent.VK_S && perdeu && !save) {

            try {
                
                carregaArquivo();
                
                newSave = new BufferedWriter(new FileWriter("save.txt"));
                for (int i = 0; i < data.size(); ++i) {
                    newSave.write(Integer.toString ( points.get(i) ) );
                    newSave.newLine();
                    newSave.write(data.get(i));
                    newSave.newLine();
                }
                
                newSave.close();
                save = true;
                if (score) procura();
            
            } catch (IOException ex) {
                ex.printStackTrace();
            }

            repaint();
        }
        if (e.getKeyCode() == KeyEvent.VK_P && perdeu && !stop) {
            score = true;
            procura();
            
            repaint();
        }

        if (e.getKeyCode() == KeyEvent.VK_RIGHT) {
            movimento = true;
            
            if (!left) {
                right = true;
                up = down = false;
            }

        }
        
        if (e.getKeyCode() == KeyEvent.VK_LEFT) {
            movimento = true;
            
            if (!right) {
                left = true;
                up = down = false;
            }

        }

        if (e.getKeyCode() == KeyEvent.VK_UP) {
            movimento = true;
            
            if (!down) {
                up = true;
                left = right = false;
            }

        }

        if (e.getKeyCode() == KeyEvent.VK_DOWN) {
            movimento = true;
            
            if (!up) {
                down = true;
                left = right = false;
            }

        }

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (perdeu || stop || score) {
            return;
        }
        
        timer.start();

        if (right) {

            for (int r = tamanho - 1; r >= 0; r--) {
                cobraY[r + 1] = cobraY[r];
            }

            for (int r = tamanho; r >= 0; r--) {
                if (r == 0) {
                    cobraX[r] = cobraX[r] + 25;
                } else {
                    cobraX[r] = cobraX[r - 1];
                }

                if (cobraX[r] > width - 50) {
                    cobraX[r] = 25;
                }

            }

            repaint();
        }

        if (left) {

            for (int r = tamanho - 1; r >= 0; r--) {
                cobraY[r + 1] = cobraY[r];
            }

            for (int r = tamanho; r >= 0; r--) {
                if (r == 0) {
                    cobraX[r] = cobraX[r] - 25;
                } else {
                    cobraX[r] = cobraX[r - 1];
                }

                if (cobraX[r] < 25) {
                    cobraX[r] = width - 50;
                }

            }

            repaint();

        }

        if (up) {

            for (int r = tamanho - 1; r >= 0; r--) {
                cobraX[r + 1] = cobraX[r];
            }

            for (int r = tamanho; r >= 0; r--) {
                if (r == 0) {
                    cobraY[r] = cobraY[r] - 25;
                } else {
                    cobraY[r] = cobraY[r - 1];
                }

                if (cobraY[r] < 25) {
                    cobraY[r] = height - 75;
                }

            }

            repaint();
        }

        if (down) {
            for (int r = tamanho - 1; r >= 0; r--) {
                cobraX[r + 1] = cobraX[r];
            }

            for (int r = tamanho; r >= 0; r--) {
                if (r == 0) {
                    cobraY[r] = cobraY[r] + 25;
                } else {
                    cobraY[r] = cobraY[r - 1];
                }

                if (cobraY[r] > height - 75) {
                    cobraY[r] = 25;
                }

            }

            repaint();
        }

    }

    @Override
    public void keyReleased(KeyEvent e) {
    }

    @Override
    public void keyTyped(KeyEvent e) {
    }

}
