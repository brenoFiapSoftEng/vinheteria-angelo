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

        <form action="LoginServlet" method="post">
            <input type="email" name="email" placeholder="E-mail" required>
            <input type="password" id="senha" name="senha" placeholder="Senha" required>
            <button type="submit" class="btn-acessar">Acessar</button>
        </form>
    </div>
    <p><a href="recuperacaosenha.html">Esqueceu a senha?</a></p>
    <p class="login-link">Não tenho cadastro. <a href="cadastro.jsp">Cadastrar</a></p>
  </div>
</body>
</html>
