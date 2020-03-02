package code;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class RandomNumber {
	
	public static void main(String[] args) {
		
		/* create */
		JFrame frame = new JFrame("Random Number - Dilson 2020");
		JPanel panel = new JPanel();
		
		//textField configurations
		JTextField text = new JTextField(15);
		text.setToolTipText("<html><b><font color=red>"
                + "Write a number here" + "</font></b></html>");
		text.setText("Write a number here");
		text.selectAll();
		//
		
		panel.add(text);
		
		JButton button = new JButton("OK");
		button.setToolTipText("<html><b><font color=blue>"
                + "Pres here" + "</font></b></html>");
		
		panel.add(button);
		
		JLabel number = new JLabel("R = 0");
		number.setToolTipText("<html><b><font color=blue>"
                + "Chosed number" + "</font></b></html>");
		panel.add(number);
		
		/* clicked button */
		button.addActionListener((ActionListener) new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(text.getText().isEmpty() || !(((String) text.getText()).matches("[0-9]+")) || text.getText().length() > 3) {
					JOptionPane.showMessageDialog(null, 
                            "WRITE a correct number!", 
                            "Are you kidding me?", 
                            JOptionPane.WARNING_MESSAGE);
				}
				else {
					int maxValue = Integer.parseInt(text.getText());
					int randomNumber = (int)(Math.random() * maxValue) + 1;
					number.setText("R = " + Integer.toString(randomNumber));
				}
			}
		});
		
		frame.add(panel);
	
		/* center screen */
		frame.pack();
		frame.setLocationRelativeTo(null);
		
		/* configurations */
		frame.setSize(325, 85);
		frame.setVisible(true);
		text.requestFocusInWindow();
		
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
	}

}
