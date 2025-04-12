<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil - Vinheria Agnello</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Tangerine:wght@700&display=swap">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/sidebar.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/perfil.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>
<main>
    <div class="perfil">
        <div class="perfil-conteudo">
            <h2>Meu Perfil</h2>

            <!-- Foto de perfil -->
            <div class="foto-cliente">
                <img src="images/perfil.png" alt="Foto do Cliente">
            </div>

            <!-- Formulário do perfil -->
            <form method="post" action="#">
                <label>Nome</label>
                <input class="input-cinza" type="text" name="nome" value="Fiap" />

                <label>Email</label>
                <input class="input-cinza" type="email" name="email" value="fiap@fiap.com.br" />

                <label>Telefone</label>
                <input class="input-cinza" type="text" name="telefone" value="(11) 99999-99999" />

                <button type="submit" class="btn-salvar">Salvar</button>
            </form>

            <!-- Endereço -->
            <h3>Endereços Cadastrados</h3>
            <div class="info-bloco endereco">
                Av. Paulista, 1106 - São Paulo
            </div>
            <button class="btn-salvar">Editar</button>

            <!-- Histórico de Pedidos -->
            <h3>Histórico de Pedidos</h3>
            <div class="info-bloco pedido">
                <li>Cesta de Presente 1 - R$ 340,00</li>
                <li>Vinho Tinto Chileno - R$ 179,00</li>
            </div>
        </div>
    </div>
</main>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        const hamburger = document.getElementById('hamburger');
        const isOpen = sidebar.classList.contains('open');

        if (isOpen) {
            sidebar.classList.remove('open');
            hamburger.style.display = 'block';
        } else {
            sidebar.classList.add('open');
            hamburger.style.display = 'none';
        }
    }
</script>
<footer style="margin-top: 40px; text-align: center; padding: 20px;">
    <p style="font-size: 16px; color: #333;">Compartilhe seu perfil nas redes sociais</p>
    <div style="margin-top: 10px; font-size: 24px;">
        <a href="https://facebook.com" target="_blank" style="margin: 0 15px; color: black;">
            <i class="fab fa-facebook"></i>
        </a>
        <a href="https://instagram.com" target="_blank" style="margin: 0 15px; color: black;">
            <i class="fab fa-instagram"></i>
        </a>
        <a href="https://twitter.com" target="_blank" style="margin: 0 15px; color: black;">
            <i class="fab fa-twitter"></i>
        </a>
    </div>
</footer>


</body>
</html>


