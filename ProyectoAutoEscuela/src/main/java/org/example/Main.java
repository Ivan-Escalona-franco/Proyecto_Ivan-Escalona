package org.example;

import org.example.AutoEsculaUI;

import javax.swing.*;

public class Main {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            AutoEsculaUI ui = new AutoEsculaUI();
            ui.setVisible(true);
        });
    }
}
