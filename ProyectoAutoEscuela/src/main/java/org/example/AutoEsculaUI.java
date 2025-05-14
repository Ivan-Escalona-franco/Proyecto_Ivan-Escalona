package org.example;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;

public class AutoEsculaUI extends JFrame {
    private JTabbedPane tabbedPane;

    public AutoEsculaUI() {
        setTitle("Gestor de AutoEscula");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(800, 600);

        tabbedPane = new JTabbedPane();

        addTab("Alumnos", "SELECT * FROM Alumno");
        addTab("Instructores", "SELECT * FROM Instructor");
        addTab("Clases Prácticas", "SELECT * FROM ClasePractica");
        addTab("Tests", "SELECT * FROM Test");
        addTab("Preguntas", "SELECT * FROM Pregunta");
        addTab("Resultados", "SELECT * FROM Resultado");
        addTab("Notificaciones", "SELECT * FROM Notificacion");

        add(tabbedPane);
    }

    private void addTab(String title, String query) {
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            ResultSetMetaData meta = rs.getMetaData();
            int columnCount = meta.getColumnCount();
            String[] columnNames = new String[columnCount];
            for (int i = 1; i <= columnCount; i++) {
                columnNames[i - 1] = meta.getColumnName(i);
            }

            DefaultTableModel model = new DefaultTableModel(columnNames, 0);

            while (rs.next()) {
                Object[] row = new Object[columnCount];
                for (int i = 1; i <= columnCount; i++) {
                    row[i - 1] = rs.getObject(i);
                }
                model.addRow(row);
            }

            JTable table = new JTable(model);
            JScrollPane scrollPane = new JScrollPane(table);

            tabbedPane.addTab(title, scrollPane);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(this,
                    "Error al cargar datos de " + title + ": " + e.getMessage(),
                    "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
