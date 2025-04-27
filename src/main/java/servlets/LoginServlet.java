package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // Logs de debug para verificar parâmetros recebidos
        System.out.println("LoginServlet - recebidos email=" + email + ", senha=" + senha);

        try {
            // Carrega o driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:sqlserver://vinheria-server.database.windows.net:1433;" +
                            "database=vinheria_db;" +
                            "user=adminuser;" +
                            "password=Password123!;" +
                            "encrypt=true;" +
                            "trustServerCertificate=false;" +
                            "hostNameInCertificate=*.database.windows.net;" +
                            "loginTimeout=30;");

            String sql = "SELECT email, senha FROM USUARIO WHERE email = ? AND senha = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, senha);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String emailBanco = rs.getString("email");
                String senhaBanco = rs.getString("senha");

                // Log para verificar valores retornados do banco
                System.out.println(
                        "LoginServlet - banco retornou emailBanco=" + emailBanco + ", senhaBanco=" + senhaBanco);

                // Redireciona para index.jsp em caso de sucesso
                response.sendRedirect("index.jsp");
            } else {
                System.out.println("LoginServlet - usuário/senha inválidos");
                response.sendRedirect("errologin.jsp");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errologin.jsp");
        }
    }
}
