#include <iostream>
#include <vector>
#include <string>
using namespace std;

struct Tarea {
    string descripcion;
    bool completada;
};

class gestorTareas {
private:
    vector<Tarea> tareas;
public:
    void agregarTarea(const string& desc) {
        tareas.push_back({desc, false});
    }

    void marcarCompletada(int index) {
        if (index >= 0 && index < tareas.size()) {
            tareas[index].completada = true;
        }
    }

    void listarTareas() {
        cout << "\nLista de tareas:\n";
        for (size_t i = 0; i < tareas.size(); ++i) {
            cout << i + 1 << ". " << tareas[i].descripcion << " - " << (tareas[i].completada ? "Completada" : "Pendiente") << endl;
        }
    }
};

int main() {
    gestorTareas gestor;
    int opcion;
    string descripcion;

    do {
        cout << "\n--- GESTOR DE TAREAS ---\n";
        cout << "1. Agregar tarea\n2. Marcar como completada\n3. Listar tareas\n4. Salir\n";
        cout << "Seleccione una opción: ";
        cin >> opcion;
        cin.ignore();
        
        if (opcion == 1) {
            cout << "Descripción: ";
            getline(cin, descripcion);
            gestor.agregarTarea(descripcion);
        } else if (opcion == 2) {
            int index;
            cout << "Numero de tarea a completar: ";
            cin >> index;
            gestor.marcarCompletada(index - 1);
        } else if (opcion == 3) {
            gestor.listarTareas();
        }
    } while (opcion != 4);
    
    return 0;
}
