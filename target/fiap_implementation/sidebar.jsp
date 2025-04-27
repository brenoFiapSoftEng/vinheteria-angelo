<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="sidebar" id="sidebar">
  <div class="sidebar-header">
    <img src="images/logo.png" alt="Logo" class="sidebar-logo" />
    <button class="close-btn" onclick="toggleSidebar()">
      <i class="fas fa-bars"></i>
    </button>
  </div>

  <hr class="sidebar-divider" />

  <ul class="sidebar-main">
    <li>
      <a href="perfil.jsp"><i class="fas fa-user"></i> Meu Perfil</a>
    </li>
    <li>
      <a href="cart.jsp"><i class="fas fa-shopping-basket"></i> Meu Carrinho</a>
    </li>
    <li>
      <a href="address-payment.jsp"
        ><i class="fas fa-credit-card"></i> Endereços e Pagamento</a
      >
    </li>
  </ul>

  <div class="sidebar-footer">
    <ul>
      <li>
        <a href="#"
          ><i class="fas fa-question-circle"></i> Perguntas Frequentes</a
        >
      </li>
      <li>
        <a href="#"><i class="fas fa-file-contract"></i> Termos e Condições</a>
      </li>
      <li>
        <a href="#"><i class="fas fa-user-shield"></i> Aviso de Privacidade</a>
      </li>
    </ul>
  </div>
</div>
