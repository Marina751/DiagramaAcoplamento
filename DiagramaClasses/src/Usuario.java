import java.util.ArrayList;
import java.util.List;

public abstract class Usuario {
    // atributos
    // o que fretistas e clientes tem em comum?
    public String nome;
    public String email;
    public String contato;
    public String senha;
    public final List<Frete> fretes = new ArrayList<>();

    // metodos
    // o que, tanto clientes quanto fretistas, fazem?
}
