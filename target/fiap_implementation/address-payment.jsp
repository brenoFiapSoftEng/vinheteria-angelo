<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Tangerine:wght@700&display=swap"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/sidebar.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/responsive.css" />
    <link rel="stylesheet" href="css/address-payment.css" />
  </head>
  <body>
    <%@ include file="header.jsp" %> <%@ include file="sidebar.jsp" %>

    <main class="container">
      <section class="delivery">
        <h1>Endereço de entrega</h1>
        <div class="delivery-info">
          <div class="delivery-info-item">
            <label class="delivery-info-label">Apelido</label>
            <input
              class="delivery-info-input"
              placeholder="Ex: Casa, Trabalho, etc."
            />
          </div>
          <div class="delivery-info-item">
            <label class="delivery-info-label">Endereço</label>
            <input
              class="delivery-info-input"
              placeholder="Ex: Avenida Paulista, 1001"
            />
          </div>
          <div class="delivery-info-item">
            <label class="delivery-info-label">UF/Cidade</label>
            <input class="delivery-info-input" placeholder="Ex: São Paulo/SP" />
          </div>
        </div>
      </section>

      <section class="delivery">
        <h1>Forma de pagamento</h1>
        <div class="delivery-info">
          <div class="delivery-info-item">
            <label class="delivery-info-label">Apelido</label>
            <input class="delivery-info-input" placeholder="Ex: Mastercard" />
          </div>
          <div class="delivery-info-item">
            <label class="delivery-info-label">Tipo Cartão</label>
            <input class="delivery-info-input" placeholder="Ex: Débito" />
          </div>
          <div class="delivery-info-item">
            <label class="delivery-info-label">Número do cartão</label>
            <input
              class="delivery-info-input"
              placeholder="0000 0000 0000 0000"
            />
          </div>
          <div class="delivery-info-item">
            <label class="delivery-info-label">Data de Validade</label>
            <input class="delivery-info-input" placeholder="MM/AA" />
          </div>
          <div class="delivery-info-item">
            <label class="delivery-info-label">CVV</label>
            <input class="delivery-info-input" placeholder="Ex: 123" />
          </div>
        </div>
      </section>
    </main>

    <script>
      function toggleSidebar() {
        const sidebar = document.getElementById("sidebar");
        const hamburger = document.getElementById("hamburger");
        const isOpen = sidebar.classList.contains("open");

        if (isOpen) {
          sidebar.classList.remove("open");
          hamburger.style.display = "block";
        } else {
          sidebar.classList.add("open");
          hamburger.style.display = "none";
        }
      }
    </script>
  </body>
</html>
