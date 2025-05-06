<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Exercícios de Divisão de Polinômios</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    animation: {
                        fadeIn: 'fadeIn 1s ease-out',
                        slideUp: 'slideUp 0.8s ease-out',
                        pulse: 'pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite'
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: 0 },
                            '100%': { opacity: 1 },
                        },
                        slideUp: {
                            '0%': { transform: 'translateY(20px)', opacity: 0 },
                            '100%': { transform: 'translateY(0)', opacity: 1 },
                        },
                    },
                    colors: {
                        primary: '#7c3aed',
                        secondary: '#3b82f6',
                        accent: '#ec4899',
                        correct: '#10b981',
                        incorrect: '#ef4444'
                    },
                }
            }
        };

        function toggleResposta(questaoIndex) {
            var resposta = document.getElementById("respostaCorreta" + questaoIndex);
            var botao = document.getElementById("botaoResposta" + questaoIndex);
            if (resposta.style.display === "none") {
                resposta.style.display = "block";
                botao.textContent = "Ocultar Resposta";
                botao.classList.remove("bg-accent");
                botao.classList.add("bg-purple-600");
            } else {
                resposta.style.display = "none";
                botao.textContent = "Mostrar Resposta Correta";
                botao.classList.remove("bg-purple-600");
                botao.classList.add("bg-accent");
            }
        }
    </script>
</head>
<body class="bg-gradient-to-br from-indigo-900 via-purple-800 to-blue-900 text-white min-h-screen font-sans leading-relaxed p-6">

<header class="mb-10">
    <nav class="flex justify-center gap-6 text-lg font-semibold p-4 bg-white/10 backdrop-blur-md rounded-xl shadow-lg animate-fadeIn">
        <a href="home.jsp" class="hover:underline hover:text-accent transition duration-300">🏠 Página Inicial</a>
        <a href="calculadora.jsp" class="hover:underline hover:text-accent transition duration-300">🧮 Calculadora</a>
    </nav>
</header>

<main class="max-w-4xl mx-auto animate-slideUp">
    <section class="bg-white/10 p-8 rounded-xl shadow-xl hover:shadow-2xl transition duration-300">
        <h1 class="text-4xl font-bold text-center text-accent mb-8">📚 Exercícios de Divisão de Polinômios</h1>

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

        questoes.add(new Questao("2x² + 3x + 1", "x + 1", "2x + 1, resto: 0", new String[]{
            "2x + 1, resto: 0", "x² + 1, resto: x", "2x + 1, resto: 1", "3x + 2, resto: 1"
        }));

        questoes.add(new Questao("x² - 4", "x - 2", "x + 2, resto: 0", new String[]{
            "x + 2, resto: 0", "x - 2, resto: 4", "x + 2, resto: 4", "x² - 4, resto: 0"
        }));

        questoes.add(new Questao("x² + 2x + 3", "x + 1", "x + 1, resto: 2", new String[]{
            "x + 1, resto: 2", "x + 2, resto: 1", "x - 1, resto: 4", "x², resto: 1"
        }));

        int indiceRespondida = -1;
        String respostaDada = null;

        if (request.getParameter("questaoIndex") != null) {
            indiceRespondida = Integer.parseInt(request.getParameter("questaoIndex"));
            respostaDada = request.getParameter("resposta");
        }
        %>

        <div class="space-y-8">
        <% for (int i = 0; i < questoes.size(); i++) {
            Questao q = questoes.get(i);
            boolean respondida = (i == indiceRespondida && respostaDada != null);
            boolean correta = respondida && respostaDada.equals(q.respostaCorreta);
        %>
            <form method="post" class="bg-white/5 p-6 rounded-xl shadow-md hover:shadow-lg transition duration-300 animate-fadeIn">
                <div class="mb-4">
                    <p class="text-xl font-semibold text-purple-300"><span class="text-2xl text-accent"><%= (i + 1) %>.</span> Divida <code class="bg-white/10 px-2 py-1 rounded"><%= q.dividendo %></code> por <code class="bg-white/10 px-2 py-1 rounded"><%= q.divisor %></code>:</p>
                </div>

                <div class="space-y-3 mb-5">
                    <% for (String alt : q.alternativas) { 
                        boolean selecionada = respondida && alt.equals(respostaDada);
                    %>
                        <label class="flex items-center space-x-3 p-3 rounded-lg hover:bg-white/10 transition cursor-pointer <%= selecionada ? "bg-white/20" : "" %>">
                            <input type="radio" name="resposta" value="<%= alt %>" class="h-5 w-5 text-accent" <%= selecionada ? "checked" : "" %> required>
                            <span class="text-lg"><%= alt %></span>
                        </label>
                    <% } %>
                </div>

                <input type="hidden" name="questaoIndex" value="<%= i %>">
                <button type="submit" class="bg-accent hover:bg-pink-600 text-white font-bold py-2 px-6 rounded-full shadow-md transform hover:scale-105 transition duration-300">
                    ✅ Verificar Resposta
                </button>

                <% if (respondida) { %>
                    <div class="mt-4 p-4 rounded-lg <%= correta ? "bg-correct/20 border-l-4 border-correct" : "bg-incorrect/20 border-l-4 border-incorrect" %>">
                        <% if (correta) { %>
                            <p class="text-correct font-bold text-lg">🎉 Correto! Você acertou!</p>
                        <% } else { %>
                            <p class="text-incorrect font-bold text-lg">❌ Incorreto! Sua resposta: <span class="text-white"><%= respostaDada %></span></p>
                            
                            <div id="respostaCorreta<%= i %>" class="hidden mt-2">
                                <p class="text-green-400 font-medium">Resposta correta: <span class="text-white font-semibold"><%= q.respostaCorreta %></span></p>
                            </div>
                            
                            <button id="botaoResposta<%= i %>" type="button" onclick="toggleResposta(<%= i %>)" class="mt-2 bg-accent hover:bg-purple-600 text-white py-1 px-4 rounded-full text-sm transition duration-300">
                                Mostrar Resposta Correta
                            </button>
                        <% } %>
                    </div>
                <% } %>
            </form>
        <% } %>
        </div>
    </section>
</main>

<footer class="text-center text-sm text-white/70 mt-12 animate-fadeIn">
    <p>© 2025 Divisão de Polinômios | Matéria: Programação Orientada a Objetos Avançada</p>
	<p>Desenvolvido por: Filipe Magalhães, Matheus Barros, Camilly dos Santos</p>
</footer>

</body>
</html>