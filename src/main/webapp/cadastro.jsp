<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro</title>
  <link rel="stylesheet" href="css/styleCadastro.css">
</head>
<body>
  <div class="cadastro-container">
    <div class="form-content">
      <div class="logo">
        <img src="img/logo.png" alt="Logo">
      </div>

      <form action="CadastroServlet" method="post" onsubmit="return validarSenha();">
        <input type="email" name="email" placeholder="E-mail" required>
        <input type="password" id="senha" name="senha" placeholder="Senha" required>
        <input type="password" id="confirmarSenha" placeholder="Confirmar senha" required>
        <button type="submit" class="btn-acessar">Acessar</button>
      </form>
    </div>

    <p class="login-link">Já tenho cadastro. <a href="login.jsp">Logar</a></p>
  </div>

  <script>
    function validarSenha() {
      var senha = document.getElementById("senha").value;
      var confirmar = document.getElementById("confirmarSenha").value;
      if (senha !== confirmar) {
        alert("As senhas não coincidem.");
        return false;
      }
      return true;
    }
  </script>
</body>
</html>
