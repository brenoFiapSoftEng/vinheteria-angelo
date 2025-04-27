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
    <link rel="stylesheet" href="css/summary.css" />
  </head>
  <body>
    <header class="header">
      <a href="cart.jsp" class="back-button">
        <i class="fas fa-arrow-left"></i>
      </a>
      <h1>Resumo do Pedido</h1>
    </header>

    <main>
      <section class="order-items">
        <div class="order-item">
          <div class="item-image">
            <img
              src="images/vinho1.png"
              alt="Vinho Chileno Vales de los Cantos"
            />
          </div>
          <div class="item-info">
            <p>Vinho Chileno Vales de los Cantos</p>
            <div class="item-quantity">
              <span>1</span>
            </div>
          </div>
          <div class="item-price">
            <span>R$ 179,90</span>
          </div>
        </div>

        <div class="order-item">
          <div class="item-image">
            <img
              src="images/vinho1.png"
              alt="Vinho Chileno Vales de los Cantos"
            />
          </div>
          <div class="item-info">
            <p>Vinho Chileno Vales de los Cantos</p>
            <div class="item-quantity">
              <span>1</span>
            </div>
          </div>
          <div class="item-price">
            <span>R$ 179,90</span>
          </div>
        </div>

        <div class="order-item">
          <div class="item-image">
            <img
              src="images/vinho1.png"
              alt="Vinho Chileno Vales de los Cantos"
            />
          </div>
          <div class="item-info">
            <p>Vinho Chileno Vales de los Cantos</p>
            <div class="item-quantity">
              <span>1</span>
            </div>
          </div>
          <div class="item-price">
            <span>R$ 179,90</span>
          </div>
        </div>
      </section>

      <section class="order-summary">
        <h2>Resumo de valores</h2>
        <div class="summary-row">
          <span>Subtotal</span>
          <span>R$ 1.234,56</span>
        </div>
        <div class="summary-row">
          <span>Taxa de Entrega</span>
          <span>R$ 20,23</span>
        </div>
        <div class="summary-row total">
          <span>Total</span>
          <span>R$ 1.255,56</span>
        </div>
      </section>

      <section class="payment-info">
        <h2>Forma de Pagamento</h2>
        <div class="payment-method">
          <span>Crédito</span>
          <div class="card-info">
            <i class="fab fa-cc-visa"></i>
            <span>**** **** **** 5164</span>
          </div>
        </div>
      </section>

      <section class="delivery-info">
        <h2>Endereço de Entrega</h2>
        <div class="address">
          <strong>Maria Silva</strong>
          <p>Avenida Paulista, 1234</p>
          <p>São Paulo, SP</p>
        </div>
      </section>

      <button class="order-button">Pedir</button>
    </main>
  </body>
</html>
