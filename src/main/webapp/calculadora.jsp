<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.regex.*" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Divisão de Polinômios</title>
</head>
<body>
	<!-- Header com navegação -->
	<header>
		<nav>
			<a href="home.jsp">Página Inicial</a>
			<a href="exercicios.jsp">Exercicios de divisão</a>
		</nav>
	</header>

	<h1>Divisão de Polinômios</h1>
	
	<form method="post">
		<label>Polinômio 1 (ex: 4x^3+3x^2+2x+1):</label><br>
		<input type="text" name="p1" required><br><br>

		<label>Polinômio 2 (ex: x+1):</label><br>
		<input type="text" name="p2" required><br><br>

		<input type="submit" value="Dividir">
	</form>

	<%! 
	//Identifica o grau de um polinomio
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
	
	//Extrai os coeficientes deu um polinomio
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
	
	//Calcula a raiz de uma função de primeiro grau
	public double calcularRaizPrimeiroGrau(double a, double b) {
	    if (a == 0) {
	        throw new IllegalArgumentException("O coeficiente 'a' não pode ser zero.");
	    }
	    return - b / a;
	}
	
	//Função para formatar o polinomio a partir dos coeficientes ordenados
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
			
	        //Verifica se é possivel fazer com Briot-Ruffini
	        if (p1.matches(regexPolinomio) && p2.matches(regexPolinomio)) {
	            out.println("<h3>Polinômio 1: " + p1 + "</h3>");
	            out.println("<h3>Polinômio 2: " + p2 + "</h3>");

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
                    String restoStr = "Resto: " + formatarPolinomio(resto);;

                    out.println("<h3>Quociente: " + quocienteStr + "</h3>");
                    out.println("<h3>" + restoStr + "</h3>");
	            } catch (Exception e) {
	                out.println("<p style='color:red;'>Erro ao dividir os polinômios. Verifique se os dados estão corretos.</p>");
	            }

	        } else {
	            out.println("<p style='color:red;'>Por favor, insira polinômios válidos nos dois campos.</p>");
	        }
	    }
	%>
</body>
</html>
