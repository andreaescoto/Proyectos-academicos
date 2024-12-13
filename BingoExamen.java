package t003;

import java.util.Scanner;
import java.util.HashSet;

public class BingoExamen {

    public static void main(String[] args) {
        do {
            jugarBingo();
        } while (continuar());
    }

    public static void jugarBingo() {
        int[][] cartonJugador1 = generarCarton();
        int[][] cartonJugador2 = generarCarton();

        System.out.println("Cartón del Jugador 1:");
        imprimirCarton(cartonJugador1);

        System.out.println("\nCartón del Jugador 2:");
        imprimirCarton(cartonJugador2);

        int[] bombo = generarBombo();

        System.out.println("\nComienza el juego de Bingo:");
        jugarBingo(cartonJugador1, cartonJugador2, bombo);
    }

    public static int[] generarBombo() {
        int[] bombo = new int[20];
        for (int i = 0; i < 20; i++) {
            bombo[i] = i + 1;
        }
        return bombo;
    }

    public static void imprimirCarton(int[][] carton) {
        for (int[] fila : carton) {
            for (int numero : fila) {
                System.out.print(numero + "  ");
            }
            System.out.println();
        }
    }

    public static boolean continuar() {
        Scanner sc = new Scanner(System.in);
        System.out.println("¿Desea continuar jugando? (s/n)");
        String res = sc.nextLine().toLowerCase();
        return res.equals("s");
    }

    public static int[][] generarCarton() {
        int[][] carton = new int[2][5];
        HashSet<Integer> numerosUsados = new HashSet<>();

        for (int i = 0; i < 5; i++) {
            // Generar números únicos entre 1-10 para la fila superior
            int num1;
            do {
                num1 = (int) (Math.random() * 10) + 1;
            } while (numerosUsados.contains(num1));
            carton[0][i] = num1;
            numerosUsados.add(num1);

            // Generar números únicos entre 11-20 para la fila inferior
            int num2;
            do {
                num2 = (int) (Math.random() * 10) + 11;
            } while (numerosUsados.contains(num2));
            carton[1][i] = num2;
            numerosUsados.add(num2);
        }

        return carton;
    }

    public static boolean contieneNumero(int[][] carton, int numero) {
        for (int i = 0; i < carton.length; i++) {
            for (int j = 0; j < carton[i].length; j++) {
                if (carton[i][j] == numero) {
                    carton[i][j] = 0;  // Marca el número como 0
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean esCartonCompleto(int[][] carton) {
        for (int[] fila : carton) {
            for (int numero : fila) {
                if (numero != 0) {
                    return false;  // Si hay un número distinto de 0, no está completo
                }
            }
        }
        return true;
    }

    public static void jugarBingo(int[][] cartonJugador1, int[][] cartonJugador2, int[] bombo) {
        for (int numero : bombo) {
            System.out.println("Número extraído: " + numero);

            boolean jugador1Marca = contieneNumero(cartonJugador1, numero);
            boolean jugador2Marca = contieneNumero(cartonJugador2, numero);

            if (jugador1Marca) {
                System.out.println("Jugador 1 tiene el número " + numero);
            }
            if (jugador2Marca) {
                System.out.println("Jugador 2 tiene el número " + numero);
            }

            if (!jugador1Marca && !jugador2Marca) {
                System.out.println("Ninguno de los jugadores tiene el número");
            }

            // Verificar si algún jugador ha ganado
            if (esCartonCompleto(cartonJugador1)) {
                System.out.println("¡Jugador 1 gana!");
                break;
            }
            if (esCartonCompleto(cartonJugador2)) {
                System.out.println("¡Jugador 2 gana!");
                break;
            }
        }
    }
}

