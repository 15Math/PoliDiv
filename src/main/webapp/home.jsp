<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Explicações dos Métodos de Divisão</title>
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
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-gradient-to-br from-indigo-900 via-purple-800 to-blue-900 text-white min-h-screen font-sans leading-relaxed p-6">

    <!-- Header com navegação -->
    <header class="mb-10">
        <nav class="flex justify-center gap-6 text-lg font-semibold p-4 bg-white/10 backdrop-blur-md rounded-xl shadow-lg animate-fadeIn">
            <a href="calculadora.jsp" class="hover:underline hover:text-pink-400 transition duration-300">Calculadora de divisão</a>
            <a href="exercicios.jsp" class="hover:underline hover:text-pink-400 transition duration-300">Exercícios de divisão</a>
        </nav>
    </header>

    <main class="max-w-4xl mx-auto space-y-12 animate-slideUp">

        <section>
            <h1 class="text-4xl font-bold text-center text-pink-400 mb-4">Métodos de Divisão de Polinômios</h1>

            <div class="bg-white/10 p-6 rounded-xl shadow-xl hover:shadow-2xl transition duration-300">
                <h2 class="text-2xl text-purple-300 font-semibold mb-2">Método de Briot-Ruffini</h2>
                <p><strong>Quando usar:</strong> O método de Briot-Ruffini é utilizado quando queremos dividir um polinômio de grau maior por um polinômio de grau 1 (ou seja, da forma <em>x - r</em>).</p>

                <h3 class="text-lg mt-4 text-blue-300 font-medium">Passo a passo:</h3>
                <ol class="list-decimal list-inside space-y-1">
                    <li>Identifique a raiz do divisor. Se o divisor for <code>x - r</code>, a raiz é <code>r</code>. Exemplo: se for <code>x + 2</code>, a raiz é <code>-2</code>.</li>
                    <li>Liste os coeficientes do polinômio que será dividido.</li>
                    <li>Copie o primeiro coeficiente diretamente para a linha do resultado.</li>
                    <li>Multiplique esse valor pela raiz e escreva o resultado sob o próximo coeficiente, somando-os.</li>
                    <li>Repita esse processo até o final da linha de coeficientes.</li>
                    <li>O último valor obtido será o <strong>resto</strong> da divisão. Os demais formarão o <strong>quociente</strong>.</li>
                </ol>

                <h3 class="mt-4 text-blue-300 font-medium">Exemplo:</h3>
                <p>Dividir <code>2x³ - 3x² + 4x - 5</code> por <code>x - 2</code></p>
                <p><strong>Raiz:</strong> <code>r = 2</code></p>
                <p><strong>Coeficientes:</strong> 2 | -3 | 4 | -5</p>
                <p>Aplicando o método, obtemos o quociente e o resto da divisão.</p>
            </div>
        </section>

        <section>
            <div class="bg-white/10 p-6 rounded-xl shadow-xl hover:shadow-2xl transition duration-300">
                <h2 class="text-2xl text-purple-300 font-semibold mb-2">Método da Chave (Divisão Longa)</h2>
                <p><strong>Quando usar:</strong> O método da chave é usado quando o divisor é de grau maior que 1. Ele funciona de forma semelhante à divisão longa de números.</p>

                <h3 class="text-lg mt-4 text-blue-300 font-medium">Passo a passo:</h3>
                <ol class="list-decimal list-inside space-y-1">
                    <li>Escreva o polinômio dividendo e o polinômio divisor em ordem decrescente de grau.</li>
                    <li>Divida o termo de maior grau do dividendo pelo termo de maior grau do divisor. Esse será o primeiro termo do quociente.</li>
                    <li>Multiplique o divisor pelo termo encontrado e subtraia o resultado do dividendo.</li>
                    <li>Repita o processo com o novo polinômio obtido até que o grau do dividendo seja menor que o do divisor.</li>
                    <li>O que sobra é o <strong>resto</strong>. Os termos obtidos são o <strong>quociente</strong>.</li>
                </ol>

                <h3 class="mt-4 text-blue-300 font-medium">Exemplo:</h3>
                <p>Dividir <code>4x³ + 3x² - x + 5</code> por <code>2x² + 1</code></p>
                <p>Divida <code>4x³</code> por <code>2x²</code>, obtenha <code>2x</code>, e continue o processo.</p>
            </div>
        </section>

        <footer class="text-center text-sm text-gray-300 mt-10 animate-fadeIn">
            <p>Esses métodos são fundamentais para simplificar expressões algébricas e resolver equações polinomiais. 🚀</p>
        </footer>
    </main>

</body>
</html>
