<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exercícios de Divisão de Polinômios</title>
<script>
function toggleResposta(questaoIndex) {
    var resposta = document.getElementById("respostaCorreta" + questaoIndex);
    resposta.style.display = (resposta.style.display === "none" ? "block" : "none");
}
</script>
</head>
<body>

<header>
	<nav>
		<a href="home.jsp">Página Inicial</a>
		<a href="calculadora.jsp">Calculadora</a>
	</nav>
</header>

<h1>Exercícios de Múltipla Escolha</h1>

<%
class Questao {
	String dividendo;
	String divisor;
	String respostaCorreta;
	String[] alternativas;

	public Questao(String dividendo, String divisor, String respostaCorreta, String[] alternativas) {
		this.dividendo = dividendo;
		this.divisor = divisor;
		this.respostaCorreta = respostaCorreta;
		this.alternativas = alternativas;
	}
}

List<Questao> questoes = new ArrayList<>();

questoes.add(new Questao("2x^2 + 3x + 1", "x + 1", "2x + 1, resto: 0", new String[]{
	"2x + 1, resto: 0", "x^2 + 1, resto: x", "2x + 1, resto: 1", "3x + 2, resto: 1"
}));

questoes.add(new Questao("x^2 - 4", "x - 2", "x + 2, resto: 0", new String[]{
	"x + 2, resto: 0", "x - 2, resto: 4", "x + 2, resto: 4", "x^2 - 4, resto: 0"
}));

questoes.add(new Questao("x^2 + 2x + 3", "x + 1", "x + 1, resto: 2", new String[]{
	"x + 1, resto: 2", "x + 2, resto: 1", "x - 1, resto: 4", "x^2, resto: 1"
}));

int indiceRespondida = -1;
String respostaDada = null;

if (request.getParameter("questaoIndex") != null) {
	indiceRespondida = Integer.parseInt(request.getParameter("questaoIndex"));
	respostaDada = request.getParameter("resposta");
}
%>

<%
for (int i = 0; i < questoes.size(); i++) {
	Questao q = questoes.get(i);
%>
	<form method="post">
		<div>
			<p><strong><%= (i + 1) %>.</strong> Divida <code><%= q.dividendo %></code> por <code><%= q.divisor %></code>:</p>

			<% for (String alt : q.alternativas) { 
				boolean selecionada = respostaDada != null && i == indiceRespondida && alt.equals(respostaDada);
			%>
				<label>
					<input type="radio" name="resposta" value="<%= alt %>" <%= selecionada ? "checked" : "" %> required>
					<%= alt %>
				</label><br>
			<% } %>

			<input type="hidden" name="questaoIndex" value="<%= i %>">
			<input type="submit" value="Verificar">

			<% if (i == indiceRespondida && respostaDada != null) {
				if (respostaDada.equals(q.respostaCorreta)) { %>
					<p>Correto!</p>
			<% } else { %>
					<p>Incorreto! Sua resposta: <strong><%= respostaDada %></strong><br>
					Resposta correta: 
					<!-- Resposta correta inicialmente invisível -->
					<p id="respostaCorreta<%= i %>" style="display: none;">
						<strong><%= q.respostaCorreta %></strong>
					</p>
					<button type="button" onclick="toggleResposta(<%= i %>)">Mostrar Resposta Correta</button>
			<% }} %>
		</div>
	</form>
	<hr>
<% } %>

</body>
</html>
