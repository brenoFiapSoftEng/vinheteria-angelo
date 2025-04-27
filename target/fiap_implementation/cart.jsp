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
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/cart.css" />
  </head>
  <body>
    <header class="header">
      <a href="index.jsp" class="back-button">
        <i class="fas fa-arrow-left"></i>
      </a>
      <h1>Carrinho</h1>
    </header>

    <main>
      <section class="cart-items">
        <div class="cart-item">
          <div class="item-image">
            <img
              src="images/vinho1.png"
              alt="Vinho Chileno Vales de los Cantos"
            />
          </div>
          <div class="cart-item-info">
            <p>Vinho Chileno Vales de los Cantos</p>
            <strong>R$ 179,90</strong>
            <div class="quantity-control">
              <button class="quantity-btn">-</button>
              <span>02</span>
              <button class="quantity-btn">+</button>
            </div>
          </div>
        </div>

        <div class="cart-item">
          <div class="item-image">
            <img
              src="images/vinho1.png"
              alt="Vinho Chileno Vales de los Cantos"
            />
          </div>
          <div class="cart-item-info">
            <p>Vinho Chileno Vales de los Cantos</p>
            <strong>R$ 179,90</strong>
            <div class="quantity-control">
              <button class="quantity-btn">-</button>
              <span>02</span>
              <button class="quantity-btn">+</button>
            </div>
          </div>
        </div>

        <button class="add-more-button">Adicionar mais produtos</button>
      </section>

      <section class="delivery-info">
        <div class="info-row">
          <i class="fas fa-location-dot"></i>
          <div>
            <strong>Receber em</strong>
            <p>Rua XYZ, 15</p>
          </div>
        </div>
      </section>

      <section class="coupon-section">
        <div class="info-row">
          <i class="fas fa-ticket"></i>
          <p>Adicionar cupom de desconto</p>
        </div>
      </section>

      <section class="payment-info">
        <div class="info-row">
          <i class="fas fa-credit-card"></i>
          <div>
            <strong>Pagamento no App</strong>
            <p>Débito</p>
          </div>
          <button class="change-btn">Mudar</button>
        </div>
      </section>

      <section class="observations">
        <div class="observations-header">
          <i class="fas fa-message"></i>
          <strong>Observações:</strong>
        </div>
        <textarea placeholder="Digite suas observações aqui..."></textarea>
      </section>

      <section class="order-summary">
        <div class="summary-row">
          <span>Vinho Chileno Vales de los Cantos</span>
          <span>R$ 719,60</span>
        </div>
        <div class="summary-row">
          <span>Taxa de entrega</span>
          <span>R$ 7,49</span>
        </div>
        <div class="summary-row total">
          <span>Total a pagar</span>
          <span>R$ 719,60</span>
        </div>
      </section>

      <a class="order-button" href="summary.jsp">FAZER PEDIDO</a>
    </main>
  </body>
</html>
