<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.regex.*" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Calculadora de Divisão de Polinômios</title>
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
            from { transform: 'translateY(20px)'; opacity: 0; }
            to { transform: 'translateY(0)'; opacity: 1; }
        }
        .animate-fadeIn { animation: fadeIn 1s ease-out forwards; }
        .animate-slideUp { animation: slideUp 0.8s ease-out forwards; }
    </style>
</head>
<body class="bg-gradient-to-br from-indigo-900 via-purple-800 to-blue-900 text-white min-h-screen font-sans leading-relaxed p-6">
    <!-- Header com navegação -->
    <header class="mb-10">
        <nav class="flex justify-center gap-6 text-lg font-semibold p-4 bg-white/10 backdrop-blur-md rounded-xl shadow-lg animate-fadeIn">
            <a href="home.jsp" class="hover:underline hover:text-accent transition duration-300">🏠 Página Inicial</a>
            <a href="exercicios.jsp" class="hover:underline hover:text-accent transition duration-300">📘 Exercícios</a>
        </nav>
    </header>

    <main class="max-w-4xl mx-auto animate-slideUp">
        <section class="bg-white/10 p-8 rounded-xl shadow-xl hover:shadow-2xl transition duration-300">
            <h1 class="text-4xl font-bold text-center text-accent mb-6">🧮 Calculadora de Divisão de Polinômios</h1>

            <form method="post" class="space-y-6">
                <div>
                    <label class="block text-xl font-semibold mb-2 text-purple-200">Polinômio 1 (ex: 4x^3+3x^2+2x+1):</label>
                    <input type="text" name="p1" required 
                           class="w-full px-5 py-3 rounded-xl bg-white/20 text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-accent transition duration-300">
                </div>
                <div>
                    <label class="block text-xl font-semibold mb-2 text-purple-200">Polinômio 2 (ex: x+1):</label>
                    <input type="text" name="p2" required 
                           class="w-full px-5 py-3 rounded-xl bg-white/20 text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-accent transition duration-300">
                </div>
                <div class="text-center">
                    <button type="submit" 
                            class="bg-accent hover:bg-pink-600 text-white font-bold py-3 px-8 rounded-full text-lg shadow-lg transform hover:scale-105 transition duration-300">
                        🚀 Calcular Divisão
                    </button>
                </div>
            </form>

            <div class="mt-10 space-y-4 text-lg animate-fadeIn">
            <%! 
                // Identifica o grau de um polinomio
                public int getGrauPolinomio(String polinomio) {
                    int grau = 0;
                    Pattern pattern = Pattern.compile("x\\^(\\d+)");
                    Matcher matcher = pattern.matcher(polinomio);
                    while (matcher.find()) {
                        int expoente = Integer.parseInt(matcher.group(1));
                        grau = Math.max(grau, expoente);
                    }
                    if (grau == 0 && polinomio.contains("x")) {
                        grau = 1;
                    }
                    return grau;
                }
                
                // Extrai os coeficientes de um polinomio
                public double[] getCoeficientes(String polinomio, int grauMax) {
                    double[] coeficientes = new double[grauMax + 1]; 
                    Arrays.fill(coeficientes, 0);
                    Pattern pattern = Pattern.compile("([+-]?\\d*)x\\^(\\d+)|([+-]?\\d*)x|([+-]?\\d+)");
                    Matcher matcher = pattern.matcher(polinomio);
                    while (matcher.find()) {
                        if (matcher.group(1) != null && matcher.group(2) != null) {
                            double coef = matcher.group(1).isEmpty() || matcher.group(1).equals("+") ? 1 : 
                                       (matcher.group(1).equals("-") ? -1 : Integer.parseInt(matcher.group(1)));
                            int grau = Integer.parseInt(matcher.group(2));
                            coeficientes[grauMax - grau] = coef;
                        } else if (matcher.group(3) != null) {
                            double coef = matcher.group(3).isEmpty() || matcher.group(3).equals("+") ? 1 :
                                       (matcher.group(3).equals("-") ? -1 : Integer.parseInt(matcher.group(3)));
                            coeficientes[grauMax - 1] = coef;
                        } else if (matcher.group(4) != null) {
                            coeficientes[grauMax] = Integer.parseInt(matcher.group(4));
                        }
                    }
                    return coeficientes;
                }
                
                // Calcula a raiz de uma função de primeiro grau
                public double calcularRaizPrimeiroGrau(double a, double b) {
                    if (a == 0) {
                        throw new IllegalArgumentException("O coeficiente 'a' não pode ser zero.");
                    }
                    return - b / a;
                }
                
                // Função para formatar o polinomio a partir dos coeficientes ordenados
                public String formatarPolinomio(double[] coeficientes) {
                    StringBuilder sb = new StringBuilder();
                    int grau = coeficientes.length - 1;

                    for (int i = 0; i < coeficientes.length; i++) {
                        double coef = coeficientes[i];
                        int expoente = grau - i;

                        if (coef != 0) {
                            if (sb.length() > 0 && coef > 0) sb.append("+");

                            boolean isInteiro = coef == (int) coef;
                            String coefStr = isInteiro ? String.valueOf((int) coef) : String.valueOf(coef);

                            boolean ehUm = coef == 1 || coef == -1;
                            String sinal = coef < 0 ? "-" : "";

                            if (expoente == 0) {
                                sb.append(coefStr);
                            } else if (expoente == 1) {
                                if (ehUm) {
                                    sb.append(sinal).append("x");
                                } else {
                                    sb.append(coefStr).append("x");
                                }
                            } else {
                                if (ehUm) {
                                    sb.append(sinal).append("x^").append(expoente);
                                } else {
                                    sb.append(coefStr).append("x^").append(expoente);
                                }
                            }
                        }
                    }

                    return sb.length() == 0 ? "0" : sb.toString();
                }
            %>

            <%
                String p1 = request.getParameter("p1");
                String p2 = request.getParameter("p2");

                if (p1 != null && p2 != null) {
                    p1 = p1.replaceAll("\\s+", "");
                    p2 = p2.replaceAll("\\s+", "");

                    String regexPolinomio = "^-?(\\d+)?x(\\^\\d+)?([+-](\\d+)?x(\\^\\d+)?)*([+-]\\d+)?$";
                    
                    if (p1.matches(regexPolinomio) && p2.matches(regexPolinomio)) {
                        out.println("<div class='bg-white/5 p-4 rounded-lg border-l-4 border-accent mb-4'>");
                        out.println("<p class='text-purple-300 font-medium'>Polinômio 1: <span class='text-white'>" + p1 + "</span></p>");
                        out.println("<p class='text-purple-300 font-medium'>Polinômio 2: <span class='text-white'>" + p2 + "</span></p>");
                        out.println("</div>");

                        try {
                            int grauP1 = getGrauPolinomio(p1);
                            int grauP2 = getGrauPolinomio(p2);

                            double coefP1[] = getCoeficientes(p1, grauP1);
                            double coefP2[] = getCoeficientes(p2, grauP2);
                            
                            int grauQuociente = grauP1 - grauP2;
                            double coefQuoci[] = new double[grauQuociente + 1];
                            
                            double resto[];

                            if (grauP2 == 1 && grauP1 >= grauP2) {
                                // Método de Briot-Ruffini
                                coefQuoci[0] = coefP1[0];
                                double raizP2 = calcularRaizPrimeiroGrau(coefP2[0], coefP2[1]);
                                
                                for (int i = 1; i < grauP1; i++) {
                                    coefQuoci[i] = coefP1[i] + raizP2 * coefQuoci[i - 1];
                                }
                                double restoAux = coefP1[grauP1] + raizP2 * coefQuoci[grauP1 - 1];
                                resto = new double[]{restoAux};
                            
                            } else {
                                // Método da chave
                                double[] dividendo = Arrays.copyOf(coefP1, coefP1.length);
                                double[] divisor = coefP2;

                                for (int i = 0; i <= grauQuociente; i++) {
                                    int pos = i;
                                    double coef = dividendo[i] / divisor[0];
                                    coefQuoci[i] = coef;

                                    for (int j = 0; j < divisor.length; j++) {
                                        dividendo[pos + j] -= coef * divisor[j];
                                    }
                                }
                                resto = Arrays.copyOf(dividendo, dividendo.length);
                            }
                            
                            String quocienteStr = formatarPolinomio(coefQuoci);
                            String restoStr = formatarPolinomio(resto);

                            out.println("<div class='bg-gradient-to-r from-accent/10 to-primary/10 p-5 rounded-lg animate-slideUp'>");
                            out.println("<p class='text-green-400 font-bold'>✨ Quociente: <span class='text-white font-mono'>" + quocienteStr + "</span></p>");
                            out.println("<p class='text-yellow-400 font-bold mt-2'>🧩 Resto: <span class='text-white font-mono'>" + restoStr + "</span></p>");
                            out.println("</div>");
                        } catch (Exception e) {
                            out.println("<div class='text-red-400 bg-white/5 p-3 rounded-lg animate-pulse'>");
                            out.println("❌ Erro ao dividir os polinômios. Verifique se os dados estão corretos.");
                            out.println("</div>");
                        }

                    } else {
                        out.println("<div class='text-red-400 bg-white/5 p-3 rounded-lg animate-pulse'>");
                        out.println("⚠️ Por favor, insira polinômios válidos nos dois campos.");
                        out.println("</div>");
                    }
                }
            %>
            </div>
        </section>
    </main>

    <footer class="text-center text-sm text-white/70 mt-12 animate-fadeIn">
        <p>© 2023 Divisão de Polinômios | Álgebra Linear</p>
    </footer>
</body>
</html>