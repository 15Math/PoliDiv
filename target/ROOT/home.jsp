<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Divisão de Polinômios</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    animation: {
                        fadeIn: 'fadeIn 1s ease-out',
                        slideUp: 'slideUp 0.8s ease-out',
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
                    }
                }
            }
        }
    </script>
    <style>
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .animate-fadeIn { animation: fadeIn 1s ease-out forwards; }
        .animate-slideUp { animation: slideUp 0.8s ease-out forwards; }
    </style>
</head>
<body class="bg-gradient-to-br from-indigo-900 via-purple-800 to-blue-900 text-white min-h-screen font-sans leading-relaxed p-6">
    <!-- Header com navegação -->
    <header class="mb-10">
        <nav class="flex justify-center gap-6 text-lg font-semibold p-4 bg-white/10 backdrop-blur-md rounded-xl shadow-lg animate-fadeIn">
            <a href="calculadora.jsp" class="hover:underline hover:text-accent transition duration-300">🧮 Calculadora</a>
            <a href="exercicios.jsp" class="hover:underline hover:text-accent transition duration-300">📚 Exercícios</a>
        </nav>
    </header>

    <main class="max-w-4xl mx-auto animate-slideUp">
        <section class="text-center mb-12">
            <h1 class="text-4xl font-bold text-accent mb-4">Métodos de Divisão de Polinômios</h1>
            <p class="text-xl text-purple-200">Aprenda as técnicas fundamentais para divisão polinomial</p>
        </section>

        <!-- Método Briot-Ruffini -->
        <section class="mb-12">
            <div class="bg-white/10 p-8 rounded-xl shadow-xl hover:shadow-2xl transition duration-300 border-l-4 border-accent">
                <div class="flex items-start gap-4">
                    <div class="bg-accent/20 p-3 rounded-full">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-accent" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd" />
                        </svg>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold text-purple-300 mb-3">Método de Briot-Ruffini</h2>
                        <p class="mb-4"><span class="font-semibold text-blue-300">Quando usar:</span> Quando dividimos por um polinômio de grau 1 (forma <code class="bg-white/10 px-2 py-1 rounded">x - r</code>).</p>
                        
                        <div class="bg-white/5 p-4 rounded-lg mb-4">
                            <h3 class="text-lg font-semibold text-blue-300 mb-2">🔍 Passo a passo:</h3>
                            <ol class="list-decimal list-inside space-y-2 marker:text-accent">
                                <li>Identifique a raiz do divisor (<code>x - r → r</code>)</li>
                                <li>Liste os coeficientes do dividendo</li>
                                <li>Copie o primeiro coeficiente para o resultado</li>
                                <li>Multiplique pela raiz e some com o próximo coeficiente</li>
                                <li>Repita até o final - último valor é o resto</li>
                            </ol>
                        </div>

                        <div class="bg-black/20 p-4 rounded-lg">
                            <h3 class="text-lg font-semibold text-blue-300 mb-2">📝 Exemplo Prático:</h3>
                            <p>Dividir <code class="bg-white/10 px-2 py-1 rounded">2x³ - 3x² + 4x - 5</code> por <code class="bg-white/10 px-2 py-1 rounded">x - 2</code></p>
                            <div class="mt-3 font-mono bg-black/30 p-3 rounded overflow-x-auto">
                                <p>Raiz (r) = 2 |   2   -3    4    -5</p>
                                <p>           |        4    2    12</p>
                                <p>           -------------------------</p>
                                <p>                2    1    6     7   → Resto = 7</p>
                            </div>
                            <p class="mt-2">Quociente: <code class="bg-white/10 px-2 py-1 rounded">2x² + x + 6</code></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Método da Chave -->
        <section>
            <div class="bg-white/10 p-8 rounded-xl shadow-xl hover:shadow-2xl transition duration-300 border-l-4 border-secondary">
                <div class="flex items-start gap-4">
                    <div class="bg-secondary/20 p-3 rounded-full">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-secondary" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd" />
                        </svg>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold text-purple-300 mb-3">Método da Chave (Divisão Longa)</h2>
                        <p class="mb-4"><span class="font-semibold text-blue-300">Quando usar:</span> Quando o divisor tem grau maior que 1.</p>
                        
                        <div class="bg-white/5 p-4 rounded-lg mb-4">
                            <h3 class="text-lg font-semibold text-blue-300 mb-2">🔍 Passo a passo:</h3>
                            <ol class="list-decimal list-inside space-y-2 marker:text-secondary">
                                <li>Ordene os polinômios por grau decrescente</li>
                                <li>Divida os termos de maior grau</li>
                                <li>Multiplique o divisor pelo termo encontrado</li>
                                <li>Subtraia do dividendo</li>
                                <li>Repita até que o grau do resto seja menor</li>
                            </ol>
                        </div>

                        <div class="bg-black/20 p-4 rounded-lg">
                            <h3 class="text-lg font-semibold text-blue-300 mb-2">📝 Exemplo Prático:</h3>
                            <p>Dividir <code class="bg-white/10 px-2 py-1 rounded">4x³ + 3x² - x + 5</code> por <code class="bg-white/10 px-2 py-1 rounded">2x² + 1</code></p>
                            <div class="mt-3 font-mono bg-black/30 p-3 rounded overflow-x-auto">
                                <p>1. (4x³ ÷ 2x²) = 2x → primeiro termo do quociente</p>
                                <p>2. Multiplique: 2x * (2x² + 1) = 4x³ + 2x</p>
                                <p>3. Subtraia: (4x³ + 3x² - x + 5) - (4x³ + 2x) = 3x² - 3x + 5</p>
                                <p>4. Repita: (3x² ÷ 2x²) = 1.5 → próximo termo</p>
                            </div>
                            <p class="mt-2">Quociente: <code class="bg-white/10 px-2 py-1 rounded">2x + 1.5</code>, Resto: <code class="bg-white/10 px-2 py-1 rounded">-3x + 3.5</code></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    <footer class="text-center text-sm text-white/70 mt-12 animate-fadeIn">
        <p>© 2025 Divisão de Polinômios | Matéria: Programação Orientada a Objetos Avançada</p>
	    <p>Desenvolvido por: Filipe Magalhães, Matheus Barros, Camilly dos Santos</p>
    </footer>
    </main>

</body>
</html>