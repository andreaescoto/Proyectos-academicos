using System;

class CajeroAutomatico
{
    static float saldo = 1000.0f;

    static void ConsultarSaldo()
    {
        Console.WriteLine($"Saldo actual: ${saldo:F2}\n");
    }

    static void Depositar()
    {
        Console.Write("Ingrese el monto a depositar: ");
        if (float.TryParse(Console.ReadLine(), out float monto) && monto > 0)
        {
            saldo += monto;
            Console.WriteLine($"Depósito exitoso. Nuevo saldo: ${saldo:F2}\n");
        }
        else
        {
            Console.WriteLine("Monto inválido.\n");
        }
    }

    static void Retirar()
    {
        Console.Write("Ingrese el monto a retirar: ");
        if (float.TryParse(Console.ReadLine(), out float monto) && monto > 0 && monto <= saldo)
        {
            saldo -= monto;
            Console.WriteLine($"Retiro exitoso. Nuevo saldo: ${saldo:F2}\n");
        }
        else
        {
            Console.WriteLine("Fondos insuficientes o monto inválido.\n");
        }
    }

    static void Main()
    {
        int opcion;
        do
        {
            Console.WriteLine("\n--- CAJERO AUTOMÁTICO ---");
            Console.WriteLine("1. Consultar saldo");
            Console.WriteLine("2. Depositar dinero");
            Console.WriteLine("3. Retirar dinero");
            Console.WriteLine("4. Salir");
            Console.Write("Seleccione una opción: ");
            
            if (int.TryParse(Console.ReadLine(), out opcion))
            {
                if (opcion == 1) ConsultarSaldo();
                else if (opcion == 2) Depositar();
                else if (opcion == 3) Retirar();
            }
            else
            {
                Console.WriteLine("Opción inválida.\n");
            }
        } while (opcion != 4);
        
        Console.WriteLine("Gracias por usar el cajero automático.");
    }
}