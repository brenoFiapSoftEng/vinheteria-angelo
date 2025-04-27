<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minha Aplicação</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Tangerine:wght@700&display=swap">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/sidebar.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <%@ include file="sidebar.jsp" %>
    <main>
        <div class="main-content" id="main-content">
            <h2>Destaques</h2>
            <div class="carrossel">
                <div class="item"><img src="images/garrafa1.jpg" alt="Vinho 1"></div>
                <div class="item"><img src="images/garrafa2.png" alt="Vinho 2"></div>
                <div class="item"><img src="images/garrafa3.png" alt="Vinho 3"></div>
            </div>

            <div class="busca-produto">
                <input type="text" placeholder="Procure um produto" id="input-busca">
                <button onclick="buscarProduto()"><i class="fas fa-search"></i></button>
            </div>
            

            <h3>Mais Vendidos</h3>
            <div class="carrossel">
                <div class="item">
                    <img src="images/vinho1.png" alt="Vinho 1">
                    <p>Vinho Branco<br>Brasil<br>R$ 89,90</p>
                </div>
                <div class="item">
                    <img src="images/vinho2.png" alt="Vinho 2">
                    <p>Vinho Tinto<br>Chile<br>R$ 179,00</p>
                </div>
                <div class="item">
                    <img src="images/vinho3.png" alt="Vinho 3">
                    <p>Vinho Tinto<br>Itália<br>R$ 189,90</p>
                </div>
            </div>

            <h3>Cestas</h3>
            <div class="carrossel">
                <div class="item">
                    <img src="images/cesta1.jpg" alt="Cesta 1">
                    <p>Seleção 1<br>R$ 340,00</p>
                </div>
                <div class="item">
                    <img src="images/cesta2.jpg" alt="Cesta 2">
                    <p>Seleção 2<br>R$ 370,00</p>
                </div>
                <div class="item">
                    <img src="images/cesta3.jpg" alt="Cesta 3">
                    <p>Seleção 3<br>R$ 420,00</p>
                </div>
            </div>

            <h3>Tipo de Vinho</h3>
            <div class="carrossel">
                <div class="item">
                    <img src="images/tipo-branco.png" alt="Vinho Branco">
                    <p>Branco</p>
                </div>
                <div class="item">
                    <img src="images/tipo-rose.png" alt="Vinho Rosé">
                    <p>Rosé</p>
                </div>
                <div class="item">
                    <img src="images/tipo-tinto.png" alt="Vinho Tinto">
                    <p>Tinto</p>
                </div>
                <div class="item">
                    <img src="images/tipo-espumante.png" alt="Espumante">
                    <p>Espumante</p>
                </div>
            </div>

            <h3>Países</h3>
            <div class="carrossel paises">
                <div class="item">
                    <img src="images/brasil.png" alt="Brasil">
                    <p>Brasil</p>
                </div>
                <div class="item">
                    <img src="images/portugal.png" alt="Portugal">
                    <p>Portugal</p>
                </div>
                <div class="item">
                    <img src="images/italia.png" alt="Itália">
                    <p>Itália</p>
                </div>
                <div class="item">
                    <img src="images/franca.png" alt="França">
                    <p>França</p>
                </div>
                <div class="item">
                    <img src="images/argentina.png" alt="Argentina">
                    <p>Argentina</p>
                </div>
                <div class="item">
                    <img src="images/chile.png" alt="Chile">
                    <p>Chile</p>
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

        function buscarProduto() {
    const termo = document.getElementById('input-busca').value.trim();
    if (termo) {
        alert("Você buscou por: " + termo);
    }
}

    </script>
</body>
</html>
