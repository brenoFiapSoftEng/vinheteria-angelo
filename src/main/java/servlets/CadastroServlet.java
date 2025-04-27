package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

@WebServlet("/CadastroServlet")
public class CadastroServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    String confirmarSenha = senha; // só pra satisfazer o banco
    String nome = null;
    String telefone = null;
    Date dataNascimento = null;
    Date dataCadastro = Date.valueOf(LocalDate.now());
    boolean ativo = true;
    String tipoUsuario = "cliente";

    try {
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

      Connection conn = DriverManager.getConnection(
        "jdbc:sqlserver://vinheria-server.database.windows.net:1433;" +
        "database=vinheria_db;" +
        "user=adminuser;" +
        "password=Password123!;" +
        "encrypt=true;" +
        "trustServerCertificate=false;" +
        "hostNameInCertificate=*.database.windows.net;" +
        "loginTimeout=30;"
      );

      String sql = "INSERT INTO USUARIO (nome, email, senha, confirmar_senha, telefone, data_nascimento, data_cadastro, ativo, tipo_usuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";


      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setString(1, nome);
      stmt.setString(2, email);
      stmt.setString(3, senha);
      stmt.setString(4, confirmarSenha); // aqui!
      stmt.setString(5, telefone);
      stmt.setDate(6, dataNascimento);
      stmt.setDate(7, dataCadastro);
      stmt.setBoolean(8, ativo);
      stmt.setString(9, tipoUsuario);

      stmt.executeUpdate();
      conn.close();

      response.sendRedirect("sucesso.jsp");

    } catch (Exception e) {
      e.printStackTrace();
      response.sendRedirect("erro.jsp");
    }
  }
}