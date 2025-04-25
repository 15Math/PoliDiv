<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Explicações dos Métodos de Divisão</title>
</head>
<body>
	<!-- Header com navegação -->
	<header>
		<nav>
			<a href="calculadora.jsp">Calculadora de divisão</a>
			<a href="exercicios.jsp">Exercicios de divisão</a>
		</nav>
	</header>
	
	<h1>Métodos de Divisão de Polinômios</h1>

	<h2>Método de Briot-Ruffini</h2>
	<p><strong>Quando usar:</strong> O método de Briot-Ruffini é utilizado quando queremos dividir um polinômio de grau maior por um polinômio de grau 1 (ou seja, da forma <em>x - r</em>).</p>

	<h3>Passo a passo:</h3>
	<ol>
		<li>Identifique a raiz do divisor. Se o divisor for <code>x - r</code>, a raiz é <code>r</code>. Exemplo: se for <code>x + 2</code>, a raiz é <code>-2</code>.</li>
		<li>Liste os coeficientes do polinômio que será dividido.</li>
		<li>Copie o primeiro coeficiente diretamente para a linha do resultado.</li>
		<li>Multiplique esse valor pela raiz e escreva o resultado sob o próximo coeficiente, somando-os.</li>
		<li>Repita esse processo até o final da linha de coeficientes.</li>
		<li>O último valor obtido será o <strong>resto</strong> da divisão. Os demais formarão o <strong>quociente</strong>.</li>
	</ol>

	<h3>Exemplo:</h3>
	<p>Dividir <code>2x³ - 3x² + 4x - 5</code> por <code>x - 2</code></p>
	<p>Raiz: <code>r = 2</code></p>
	<p>Coeficientes: 2 | -3 | 4 | -5</p>
	<p>Aplicando o método, obtemos o quociente e o resto da divisão.</p>

	<hr>

	<h2>Método da Chave (Divisão Longa)</h2>
	<p><strong>Quando usar:</strong> O método da chave é usado quando o divisor é de grau maior que 1. Ele funciona de forma semelhante à divisão longa de números.</p>

	<h3>Passo a passo:</h3>
	<ol>
		<li>Escreva o polinômio dividendo e o polinômio divisor em ordem decrescente de grau.</li>
		<li>Divida o termo de maior grau do dividendo pelo termo de maior grau do divisor. Esse será o primeiro termo do quociente.</li>
		<li>Multiplique o divisor pelo termo encontrado e subtraia o resultado do dividendo.</li>
		<li>Repita o processo com o novo polinômio obtido até que o grau do dividendo seja menor que o do divisor.</li>
		<li>O que sobra é o <strong>resto</strong>. Os termos obtidos são o <strong>quociente</strong>.</li>
	</ol>

	<h3>Exemplo:</h3>
	<p>Dividir <code>4x³ + 3x² - x + 5</code> por <code>2x² + 1</code></p>
	<p>Divida <code>4x³</code> por <code>2x²</code>, obtenha <code>2x</code>, e continue o processo.</p>

	<hr>

	<p>Esses métodos são fundamentais para simplificar expressões algébricas e resolver equações polinomiais.</p>

</body>
</html>
