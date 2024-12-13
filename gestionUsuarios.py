usuarios = {}

def registrar():
    usuario = input("Ingrese un nombre de usuario: ")
    if usuario in usuarios:
        print("El usuario ya existe.")
    else:
        contraseña = input("Ingrese una contraseña: ")
        usuarios[usuario] = contraseña
        print("Registro exitoso.")

def iniciar_sesion():
    usuario = input("Usuario: ")
    contraseña = input("Contraseña: ")
    if usuarios.get(usuario) == contraseña:
        print("Inicio de sesión exitoso.")
    else:
        print("Usuario o contraseña incorrectos.")

def main():
    while True:
        print("\n1. Registrar usuario")
        print("2. Iniciar sesión")
        print("3. Salir")
        opcion = input("Seleccione una opción: ")
        
        if opcion == "1":
            registrar()
        elif opcion == "2":
            iniciar_sesion()
        elif opcion == "3":
            break
        else:
            print("Opción inválida.")

if __name__ == "__main__":
    main()
